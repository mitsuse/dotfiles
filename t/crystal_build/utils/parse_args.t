use strict;
use warnings;
use utf8;

use t::Util;

use CrystalBuild::Utils;

subtest basic => sub {
    my $args = CrystalBuild::Utils::parse_args('0.7.4', 'prefix');
    is $args->{version}, '0.7.4';
    is $args->{prefix}, 'prefix';
    ok not $args->{definitions};
};

subtest definitions => sub {
    push @ARGV, '--definitions';

    my $args = CrystalBuild::Utils::parse_args;
    ok $args->{definitions};
};

done_testing;
