use 5.014;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'HIBP',
    VERSION_FROM      => 'lib/HIBP/V3.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {
        'LWP::UserAgent'       => 6.38,
        'LWP::Protocol::https' => 6.07,
        'Digest::SHA1'         => 2.13,
        'Throw'                => 0.13,
        'Getopt::Long'         => 2.5,
    },
    ABSTRACT_FROM     => 'lib/HIBP/V3.pm', # retrieve abstract from module
    AUTHOR            => 'Dillan Hildebrand <dillan.hildebrand@protonmail.com>',
);
