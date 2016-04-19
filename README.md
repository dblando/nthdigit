# nthdigit
Perl exercises to find digit N of the infinitely long 12345678910111213...

This was an assignment from Kibo back in 2009:
"Given the infinitely large integer

B = 12345678910111213...

We are only ever interested in finding the Nth digit of B (where N can be anything up to one million.)
Do these four exercises in this order:

1)  Using only pencil and paper, determine the 500,000th digit of B.

2)  Write a Perl program that will print the Nth digit of B after actually constructing the entire left half of B (use strings, don't try to use BigNum.)

3)  Write a Perl program that will print the Nth digit of B without actually constructing the entire left half of B (use the same algorithm you used in problem 1.)

4)  What is the time complexity of the two programs relative to N? In the same notation, what is their memory usage?"

· The sprawl script is the original answer to #2;
· ordsprawl is an update to sprawl to include a cardinal suffix for printed answers. The April 2016 revision handled numbers 11-19 more effectively. It should become its own module.
· efficient.pl is the attempt to answer #3.
