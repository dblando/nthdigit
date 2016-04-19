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
if ( substr ($usernum, -1, 1) == 1)
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

# This needs to work upwards instead of downwards.
# This would also require &pivotpoint to be rewritten.
# Actually, we'll feed &pivotpoint the $userum and make it do the work.
my $digsize;
my $lowdigit = 5;
until ( $usernum > (&pivotpoint ($lowdigit)))
	{
	$lowdigit--;
	}
$digsize = $lowdigit;

my $localpos = $usernum - (&pivotpoint ($digsize));
my $integer  = floor ( $localpos / ($digsize + 1)); # Something is very wrong here.
my $position = $localpos % ($digsize + 1);
print "The integer resulting from $localpos is ", $integer + (10 ** ($digsize)) - 1, " with a remainder of $position.\n";
my $componum = ($integer - 1) + (10 ** $digsize);
my $answer   = substr ($componum, ($position - 1), 1);
# This is not incrementing the actual integer until one N later.
# eg.: 10 gives us int 9 rem 1, not int 10 rem 1.


print "The $usernum", $ordsuffix," digit has a value of ", $answer, ".\n";

sub pivotpoint ()
	{
	my $digits = shift ;
	my $pivotnum = 0;
	until ( $digits < 1 )
		{
		my $digsubtotal = 0;
		$digsubtotal = $digits * ((10 ** $digits) - (10 ** ($digits - 1)));
		$pivotnum += $digsubtotal;
		$digits--;
		}
	return $pivotnum;
	}