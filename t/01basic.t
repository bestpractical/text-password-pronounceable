#!/usr/bin/perl
use strict;
use Test::More tests => 10;

use Text::Password::Pronounceable;

{
my $pp = Text::Password::Pronounceable->new(6,10);

isa_ok($pp, 'Text::Password::Pronounceable');

my $str = $pp->generate;

ok(length($str) <= 10 && length($str) >= 6);

$str = $pp->generate(3,4);

ok(length($str) <= 4 && length($str) >= 3);
}

{
my $pp = Text::Password::Pronounceable->new(6);

isa_ok($pp, 'Text::Password::Pronounceable');

my $str = $pp->generate;

ok(length($str) == 6);

$str = $pp->generate(3,4);

ok(length($str) <= 4 && length($str) >= 3);

$str = $pp->generate(5);

ok(length($str) == 5);
}

{
# testing generate as a class method

my $str = Text::Password::Pronounceable->generate(6, 10);

ok(length($str) <= 10 && length($str) >= 6);

$str = Text::Password::Pronounceable->generate(3, 4);

ok(length($str) <= 4 && length($str) >= 3);

$str = Text::Password::Pronounceable->generate(5);

ok(length($str) == 5);
}

