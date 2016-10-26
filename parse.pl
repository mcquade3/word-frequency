#!/usr/local/bin/perl
# Mike McQuade
# parse.pl
# Takes in a text document and prints out every word that occurs in it,
# along with the number of times that each word appears.

use strict;
use warnings;

# Initialize map
my %allWords;

# Open the file to read
open(my $fh,"<Pride and Prejudice.txt") or die $!;

# Read in every line in the file
while (my $line = <$fh>){
	chomp($line); # Remove whitespace at the end of the line
	my @temp = split /\W/, $line; # Divide the words by non-word characters using a list
	foreach my $word (@temp) { 
		$word = lc $word; # Set each word to all lowercase
		$word =~ s/[\W\d_]//g; # Remove all punctuation from each word
		# If the word is an empty string, ignore it.
		# Otherwise, add it to the map.
		if ($word ne "") {
			# If the word already exists in the map,
			# then increment the value in the map by 1.
			# Otherwise, create a hash in the map with
			# that word as the key and 1 as the value.
			if ($allWords{$word}) {$allWords{$word}++;}
			else {$allWords{$word} = 1;}
		}
	}
}

# Print out all the words in the text document with
# the number of times each appears in the document.
foreach my $word (sort keys %allWords) {
	printf "%-8s %s\n", $word, $allWords{$word};
}

# Close the file
close($fh) || die "Couldn't close file properly";