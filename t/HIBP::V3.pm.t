#!/usr/bin/env perl

package HIBPTests;

use strict;
use warnings;
use feature qw(say);

use FindBin qw($Bin);
use lib "$Bin/../lib";

use HIBP::V3;
use Data::Dumper;
use Test::More tests => 25;

sub new {
    return bless {}, shift;
}

sub run_tests {
    my $self = shift;
    foreach my $sub (keys %HIBPTests::) {
        $self->$sub if $sub =~ /^test_/;
    }
}

sub test_use {
    use_ok 'HIBP::V3';
}

sub test_can {
    my $self = shift;
    my $hibp = HIBP::V3->new;
    my @subs = qw(
        get_password_status
        get_breached_site
        get_breached_sites
    );

    can_ok $hibp, @subs;
}

sub test_api_endpoint_builder {
    my $self = shift;
    my $hibp = HIBP::V3->new;
    my @epts = qw(
        breachaccount
        breaches
        breach
        dataclasses
        pasteaccount
        range
    );

    my $base = $hibp->api_endpoint_base;
    foreach my $ept (@epts) {
        my $url = $hibp->api_endpoint_builder("/$ept");
        is $url, "$base/$ept", "api_endpoint_builder ~ /$ept";
    }
}

sub test_api_endpoint_base {
    my $base = (HIBP::V3->new)->api_endpoint_base;
    is $base, 'https://haveibeenpwned.com/api/v3', 'endpoint base is correct';
}

sub test_api_version {
    is ((HIBP::V3->new)->api_version, 'v3', 'Got expected API version');
}

sub test_api_agent {
    isa_ok ((HIBP::V3->new)->api_agent, 'HTTP::Tiny', 'Got expected API agent module');
}

sub _password_list {
    return qw(
        password
        raspberry
        admin
        changeme
    )
}

sub test_password_status_single {
    my $self = shift;
    my $hibp = HIBP::V3->new;
    my @list = $self->_password_list;

    foreach my $password (@list) {
        sleep 1.5; # is in place to prevent api throttling during unit test runs
        my $status = $hibp->get_password_status($password);
        isa_ok $status, 'HASH';
        ok exists $status->{'status'}, 'status key exists in hashref response';
        is $status->{'status'}, 'compromised', "password $password publicly known";
    }
}

sub test_password_status_multi {
    my $self = shift;
    my $hibp = HIBP::V3->new;
    my @list = $self->_password_list;
    my $resp = $hibp->get_password_status(\@list);
    my @keys = keys %{$resp};

    isa_ok $resp, 'HASH';
    ok eq_array sort @keys, sort @list;
}

1;

HIBPTests->new->run_tests;
exit;


