package HIBP::V3;

use strict;
use warnings;
use feature 'say';

use Data::Dumper;
use Digest::SHA1 qw(sha1_hex);
use HTTP::Tiny;
use JSON;

our $VERSION = '1.0';

sub new {
    my $self = shift;
    my $args = { agent => HTTP::Tiny->new };
    my $blessed = bless {%$args, %{shift // {}}}, $self;
    $blessed->api_agent->agent('hibp-perl-client');
    return $blessed;
}

sub api_agent {
    return shift->{'agent'};
}

sub api_version {
    return 'v3';
}

sub api_endpoint_base {
    my $self         = shift;
    my $pwcheck      = shift // 0;
    my $pwcheck_base = 'https://api.pwnedpasswords.com/range';
    my $normal_base  = 'https://haveibeenpwned.com/api/' . $self->api_version;

    return ($pwcheck ? $pwcheck_base : $normal_base);
}

sub api_endpoint_builder {
    my ($self, $uri, $pwcheck) = @_;
    my $endpoint = $self->api_endpoint_base($pwcheck);
    return $endpoint . $uri // '';
}

sub get_account_breaches {
    return shift->__get_helper('/breachedaccount/' . shift || die "account arg was not provided!");
}

sub get_breached_sites {
    return shift->__get_helper('/breaches');
}

sub get_breached_site {
    my $self = shift;
    my $site = shift or die "Missing required site arg!";
    return $self->__get_helper("/breach/$site");
}

sub get_data_classes {
    return shift->__get_helper('/dataclasses');
}

sub get_account_pastes {
    return shift->__get_helper("/pasteaccount/" . shift || die "account arg was not provided!");
}

sub get_password_status {
    my ($self, $password) = @_;

    if (!defined $password || !$password) {
        die "password param cant be undefined!\n";
    }

    my $sha1 = sha1_hex($password);
    my $five = substr($sha1, 0, 5);
    my $resp = $self->api_agent->get($self->api_endpoint_builder("/$five", 1))->{'content'};
    my $hash = {
        status      => 'ok',
        occurrences => 0,
    };

    if (!defined $resp || !$resp) {
        die "recv'd an empty response...";
    }

    my @hashes  = split /\n/, $resp;

    foreach my $line (@hashes) {
        my ($pass_hash, $count) = split /:/, $line;
        if (uc($sha1) eq uc($five . $pass_hash)) {
            $hash->{'status'}      = 'compromised';
            $hash->{'occurrences'} = int($count);
            last;
        }
    }

    return $hash;
}

sub __get_helper {
    my ($self, $endpoint) = @_;
    my $headers = {};

    if ($endpoint =~ /^\/(breachedaccount|pasteaccount)\//) {
        $headers->{'hibp-api-key'} = $ENV{'HIBP_API_KEY'} // '';
    }

    my $resp_obj = $self->api_agent->get(
        $self->api_endpoint_builder($endpoint),
        { headers => $headers }
    );

    my $code = $resp_obj->{'status'};
    my $data = $resp_obj->{'content'};

    $DB::single = 1;

    return '[]' if $endpoint =~ /^\/(pasteaccount)\// && $code == 404;
    return $data;
}

1;

__END__