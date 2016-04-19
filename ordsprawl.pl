#!/usr/bin/perl -w
use strict;

=pod
Assignment from Kibo:

"Given the infinitely large integer

B = 12345678910111213...

We are only ever interested in finding the Nth digit of B (where N can be anything up to one million.)

Do these four exercises in this order:

1.)  Using only pencil and paper, determine the 500,000th digit of B.

2.)  Write a Perl program that will print the Nth digit of B after actually constructing the entire left half of B (use strings, don't try to use BigNum.)

3.)  Write a Perl program that will print the Nth digit of B without actually constructing the entire left half of B (use the same algorithm you used in problem 1.)

4.)  What is the time complexity of the two programs relative to N? In the same notation, what is their memory usage?"

This program is item 2 in the list.

=cut

use constant max => 1_000_000;

my $usernum;
print "Gimme a whole number between one and a million please\: ";
chomp ($usernum = <>);

if ( $usernum =~ /^\D?$/)
	{
	die "You didn\'t provide a number. Please re-execute the program.\n";
	}
	
if ( $usernum > max )
	{
	$usernum = max;
	print "The number you provided is larger than one million.\n";
	print "Thus I have rolled the number down to one million.\n";
	}

# This section is just some grammatical geekery.
my $ordsuffix;
if ( substr ($usernum, -2, 1) == 1) # numbers ending in 10 through 19
	{
	$ordsuffix = "th";
	}
elsif ( substr ($usernum, -1, 1) == 1)
	{
	$ordsuffix = "st";
	}
elsif ( substr ($usernum, -1, 1) == 2)
	{
	$ordsuffix = "nd";
	}
elsif ( substr ($usernum, -1, 1) == 3)
	{
	$ordsuffix = "rd";
	}
else
	{
	$ordsuffix = "th";
	}

my $biggie = ""; # must have a value, but it's gotta be undef and not zero
my $digit  = 0;
while (length ($biggie) < $usernum)
	{
	$digit++;
	$biggie .= $digit;
	}
my $answer;
$answer = substr ($biggie, ($usernum - 1), 1); # substr counts from zero

print "We reached the $usernum", $ordsuffix," digit at $digit. Its value is ", $answer, ".\n";