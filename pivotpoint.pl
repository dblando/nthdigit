#!/usr/bin/perl -w
use strict;

my $usernum;
print "Gimme a whole number between one and a million please\: ";
chomp ($usernum = <>);

my $placenum = $usernum ;
my $pivotnum = 0;
my $oldpivot;
my $digits = 1;
	
until ( $pivotnum > $placenum )
	{
	my $digsubtotal = 0;
	$oldpivot = $pivotnum;
	$digsubtotal = $digits * ((10 ** $digits) - (10 ** ($digits - 1)));
	$pivotnum += $digsubtotal;
	$digits++;
	}
$digits--;
# return ($digits, $pivotnum);
print "The calculated number will have $digits digits and will start at place $oldpivot.\n";