#!/usr/bin/perl

# Challenge 163
#
# Task 2: Summations
# Submitted by: Mohammad S Anwar
#
# You are given a list of positive numbers, @n.
#
# Write a script to find out the summations as described below.
# Example 1
#
# Input: @n = (1, 2, 3, 4, 5)
# Output: 42
#
#     1 2 3  4  5
#       2 5  9 14
#         5 14 28
#           14 42
#              42
#
# The nth Row starts with the second element of the (n-1)th row.
# The following element is sum of all elements except first element of previous
# row.
# You stop once you have just one element in the row.
#
# Example 2
#
# Input: @n = (1, 3, 5, 7, 9)
# Output: 70
#
#     1 3  5  7  9
#       3  8 15 24
#          8 23 47
#            23 70
#               70

use Modern::Perl;
use List::Util 'sum';

sub summation {
    my(@n)=@_;
    while (@n>1) {
        shift @n;
        my @m;
        for my $i (0..$#n) {
            $m[$i]=sum(@n[0..$i]);
        }
        @n=@m;
    }
    return shift @n;
}

say summation(@ARGV);
