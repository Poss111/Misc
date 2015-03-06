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
my @data;									#Original array for initial album processing
my $trackid;								#Spot for track id that is garbage
my $songid;									#Spot for song id that is garbage
my $artist;									#Spot for artist that is garbage
my $title;									#Spot for title of song that is used
my @word;									#Array to split words in title of song
my %words;									#Hash for words to count bi-gram
my $counter = 0;
my 	@checker;

# This loops through each line of the file
while($line = <INFILE>) {
	($trackid, $songid, $artist, $title) = split /<SEP>/, $line;
	$title = lc $title;
#	print "before ->$title\n";
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
	$title =~ s/[\s^]a[\s]//g;
	$title =~ s/^a[\s]//g;
	$title =~ s/[\s]an[\s]//g;
	$title =~ s/^an[\s]//g;
	$title =~ s/[\s]and[\s]//g;
	$title =~ s/^and[\s]//g; 	
	$title =~ s/[\s]by[\s]//g;
	$title =~ s/^by[\s]//g;
	$title =~ s/[\s]for[\s]//g;
	$title =~ s/^for[\s]//g;
	$title =~ s/[\s]from[\s]//g;
	$title =~ s/^from[\s]//g;
	$title =~ s/[\s]in[\s]//g;
	$title =~ s/^in[\s]//g;
	$title =~ s/[\s]of[\s]//g;
	$title =~ s/^of[\s]//g;
	$title =~ s/[\s]on[\s]//g;
	$title =~ s/^on[\s]//g;
	$title =~ s/[\s]or[\s]//g;
	$title =~ s/^or[\s]//g;
	$title =~ s/[\s]out[\s]//g;
	$title =~ s/^out[\s]//g;
	$title =~ s/[\s]the[\s]//g;
	$title =~ s/^the[\s]//g;
	$title =~ s/[\s]to[\s]//g;
	$title =~ s/^to[\s]//g;
	$title =~ s/[\s]with[\s]//g;
	$title =~ s/^with[\s]//g; 
#	print "after ->$title\n";
	if ($title =~ s/.*[^\x00-\x7F].*/\s/ || $title =~ m//) {
	}
	else {
		push @data, $title;
		(@word) = split /\s/, $title;
		for (my $k = 0; $k < scalar @word -1; $k++) {
			if ($words[$k+1] !~ m/.*[\s]/ ||  $words[$k+1] !~ m/\s/ || $words[$k+1] != NULL){
				if ($words{$word[$k]}{$word[$k+1]} != 0) {
					$words{$word[$k]}{$word[$k+1]}++;
				}
				else {
					$words{$word[$k]}{$word[$k+1]} = 1;
				}
			}
		}
	}
}

#print "@data";

#foreach my $key1 (keys %words) {
#	foreach my $key2 (keys %{%words{$key1}}) {
#		print "$key1 -> $key2 = %{$words{$key1}{$key2}} \n";
#	}
#}

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
	if ($input =~ m/q/) {
		exit 0;
	}
	else {
		print "$input";
		for ($l = 0; $l < 20; $l++){ 
			print " ";
			$input = mcw($input);
			if ($input eq NULL) {
				last;
			}
			print "$input";
			print " ";
		}
		print "\n";
		@checker =();
		print "Enter a word [Enter 'q' to quit]: ";
		$input = <STDIN>;
		chomp($input);
		print "\n";
	}
}

sub mcw{
	my $count = 0;
	$string = $_[0];
	my $followingString;
	push(@checker,$string);
	push(@checker, $string);
	if (%words{$string} == 0 || m/"\s"/) {
		return NULL;
	}
	elsif ($counter > 3) {
		$tester = pop @checker;
		my $tester2 = $checker[$counter];
		push(@checker, $tester);
		print $tester2;
		print $tester;
		if ($tester eq $tester2) {
			return NULL;
		}
		else {
			foreach my $keySet2 (keys %{%words{$string}}) {
				if ($count < $words{$string}{$keySet2}) {
					$count = $words{$string}{$keySet2};
					$followingString = $keySet2;
				}
				elsif ($count == $words{$string}{$keySet2}) {
					my $randNum = int(rand(2));
					if ($randChoice > 0) {
						$followingString = $keySet2;
					}
				}
			}
		}
		$counter++;
		return $followingString;
	}
	else {
		foreach my $keySet2 (keys %{%words{$string}}) {
			if ($count < $words{$string}{$keySet2}) {
				$count = $words{$string}{$keySet2};
				$followingString = $keySet2;
			}
			elsif ($count == $words{$string}{$keySet2}) {
				my $randNum = int(rand(2));
				if ($randChoice > 0) {
					$followingString = $keySet2;
				}
			}
		}
	}
	$counter++;
	return $followingString;
}


