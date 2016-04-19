#!/usr/bin/perl -w
use strict;
use POSIX;

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

This program is item 3 in the list.

=cut

use constant max => 1_000_000;

my $usernum;
print "Gimme a whole number between one and a million please\: ";
chomp ($usernum = <>);
	
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


my ($digsize, $turnpoint) = &pivotpoint ($usernum);
print "The calculated number will have $digsize digits and will start at place $turnpoint.\n";
my $localpos = $usernum - $turnpoint;

my $integer  = floor ( $localpos / ($digsize));
my $position = $localpos % ($digsize);

# print "The integer resulting from $localpos is ", $integer + (10 ** ($digsize - 1)) - 1, " with a remainder of $position.\n";

my $componum = ($integer - 1) + (10 ** ($digsize - 1));
my $answer   = substr ($componum, ($position - 1), 1);

print "The integer resulting from $localpos is $componum with a remainder of $position.\n";

print "The $usernum", $ordsuffix," digit has a value of ", $answer, ".\n";

=pod

I now get a different problem:
	7 and 8 get valid answers and number of digits;
	9 gets a valid answer, but the wrong # of digits (2 instead of 1);
	10 gets a valid # of digits but the wrong answer (9 instead of 0);
	11 gets both a valid answer and the correct number of digits.
	
I get the same edge-case errors around 189, the next increment of digits.
This suggests the error is in &pivotpoint.

Changing "$pivotnum > $placenum" to "$pivotnum >= $placenum" fixed the problem for 9 but not 10.
 
=cut

sub pivotpoint ()
	{
	my $placenum = shift ;
	my $pivotnum = 0;
	my $oldpivot;
	my $digits = 1;
	
	until ( $pivotnum >= $placenum )
		{
		my $digsubtotal = 0;
		$oldpivot = $pivotnum;
		$digsubtotal = $digits * ((10 ** $digits) - (10 ** ($digits - 1)));
		$pivotnum += $digsubtotal;
		$digits++;
		}
	$digits--;
	return ($digits, $oldpivot);
	}