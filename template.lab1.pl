######################################### 	
#    CSCI 305 - Programming Lab #1		
#										
#  Daniel Poss			
#  dpatposs@msn.com			
#										
#########################################

# Replace the string value of the following variable with your names.
my $name = "Daniel Poss";
my $partner = "None";
print "CSCI 305 Lab 1 submitted by $name.\n\n";

# Checks for the argument, fail if none given
if($#ARGV != 0) {
    print STDERR "You must specify the file name as the argument.\n";
    exit 4;
}

# Opens the file and assign it to handle INFILE
open(INFILE, $ARGV[0]) or die "Cannot open $ARGV[0]: $!.\n";


# YOUR VARIABLE DEFINITIONS HERE...
my @data;
my $i = 0;
my $j = 0;
my $trackid;
my $songid;
my $artist;
my $title;
my @word;

# This loops through each line of the file
while($line = <INFILE>) {
	($trackid, $songid, $artist, $title) = split /<SEP>/, $line;
	$title =~ s/[([{\\\/\_\-\"\:\+\=\*].*//g;
	$title =~ s/.*Act II ://g;
	$title =~ s/feat..*//g;
	$title =~ s/Feat..*//g;
	$title =~ s/vol.*//g;
	$title =~ s/Vol.*//g;
	$title =~ s/'//g;
	$title =~ s/\?//g;
	$title =~ s/!//g;
	$title =~ s/\.//g;
	$title =~ s/;//g;
	$title =~ s/&//g;
	$title =~ s/\$//g;
	$title =~ s/@//g;
	$title =~ s/%//g;
	$title =~ s/#//g;
	$title =~ s/\|//g;
	if ($title =~ s/.*[^\x00-\x7F].*// || $title =~ m//) {
	}
	else {
		$title = lc $title;
		push @data, $title;
		(@word) = split / /, $title;
		for (k = 0; k < scalar @word; k++) {
			
		}
		print " -> @word \n";
		$i++;
	}
}

print "Filtered words = $i \n";
# Close the file handle
close INFILE; 

# At this point (hopefully) you will have finished processing the song 
# title file and have populated your data structure of bigram counts.
print "File parsed. Bigram model built.\n\n";


# User control loop
print "Enter a word [Enter 'q' to quit]: ";
$input = <STDIN>;
chomp($input);
print "\n";	
while ($input ne "q"){
	# Replace these lines with some useful code
	while ($j != $i) {
		my $compare = pop @data;
		if ($compare =~ m/$input/) {
			my $lineNum = $i-$j;
			print "It matches. $lineNum \n";
		}
		$j++;
	}
	print "$input was entered. \n";
	$input = "q";
}

# MORE OF YOUR CODE HERE....
