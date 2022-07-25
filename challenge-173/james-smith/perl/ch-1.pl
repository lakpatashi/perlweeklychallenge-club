#!/usr/local/bin/perl

use strict;

use warnings;
use feature qw(say);
use Test::More;
use Benchmark qw(cmpthese timethis);
use Data::Dumper qw(Dumper);

my @TESTS = (
  [ 5456, 1 ],
  [ 120,  0 ],
);

is( is_esthetic($_->[0]), $_->[1] ) foreach @TESTS;
is( e($_->[0]), $_->[1] ) foreach @TESTS;

done_testing();

sub is_esthetic{
  my($f,@n)=split//,pop;
  abs( $_-$f ) == 1 ? ($f=$_) : return 0 for@n;
  1
}
#-60-|----#----|----#----|----#----|----#----|----#----|----
sub e{($a,@_)=split//,pop;1==abs$_-$a?$a=$_:return 0for@_;1}
