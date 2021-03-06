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
my @data;																	#Original array for initial album processing
my $trackid;																#Spot for track id that is garbage
my $songid;																	#Spot for song id that is garbage
my $artist;																	#Spot for artist that is garbage
my $title;																	#Spot for title of song that is used
my @word;																	#Array to split words in title of song
my %words;																	#Hash for words to count bi-gram
my $counter = 0;															#Used to count how many words have been generated for the first given name and then used 
																			#to determine if name should be checked for a pattern
my 	@checker;																#Checker array for song title generated for given starting name of song

# This loops through each line of the file
while($line = <INFILE>) {													#@while($line = <INFILE>) This while loop will run through all lines given to it by the given text file.
	($trackid, $songid, $artist, $title) = split /<SEP>/, $line;			# This line separates the line read into the while loop and separates out the line into 4 parts.		
	$title = lc $title;														# Makes all in $title(song title) lower case.
#	print "before ->$title\n";												# Prints out $title(song title) before the regular expression replacements.
	$title =~ s/[([{\\\/\_\-\"\:\+\=\*].*//g;								# This regular expression takes out everything after  any symbol like (,[,{,\,/,_,-,",:,+,=,* to get ride
																			# 	of any thing such as (Remastered edition) that is useless information.
	$title =~ s/.*Act II ://g;												# This regular expression removes any thing before "ACT II:" as well as it itself.
	$title =~ s/feat..*//g;													# This regular expression removes any thing after "feat." as well as it itself.								
	$title =~ s/Feat..*//g;													# This regular expression removes any thing before "Feat." as well as it itself.
	$title =~ s/vol.*//g;													# This regular expression removes any thing after vol as well as it itself.
	$title =~ s/Vol.*//g;													# This regular expression removes any thing after Vol as well as it itself.
	$title =~ s/'//g;														# This regular expression removes "'".
	$title =~ s/\?//g;														# This regular expression removes "?".
	$title =~ s/!//g;														# This regular expression removes "!".
	$title =~ s/\.//g;														# This regular expression removes ".".
	$title =~ s/;//g;														# This regular expression removes ";".
	$title =~ s/&//g;														# This regular expression removes "&".
	$title =~ s/\$//g;														# This regular expression removes "$".
	$title =~ s/@//g;														# This regular expression removes "@".
	$title =~ s/%//g;														# This regular expression removes "%".
	$title =~ s/#//g;														# This regular expression removes "#".
	$title =~ s/\|//g;														# This regular expression removes "|".
	$title =~ s/[\s^]a[\s]//g;												# This regular expression removes " a ".
	$title =~ s/^a[\s]//g;													# This regular expression removes "a " from the beginning of a string.
	$title =~ s/[\s]an[\s]//g;												# This regular expression removes " an ".
	$title =~ s/^an[\s]//g;													# This regular expression removes "an" from the beginning of a string
	$title =~ s/[\s]and[\s]//g;												# This regular expression removes " and ".
	$title =~ s/^and[\s]//g; 												# This regular expression removes "and " from the beginning of a string
	$title =~ s/[\s]by[\s]//g;												# This regular expression removes " by ".
	$title =~ s/^by[\s]//g;													# This regular expression removes "by " from the beginning of a string
	$title =~ s/[\s]for[\s]//g;												# This regular expression removes " for ".
	$title =~ s/^for[\s]//g;												# This regular expression removes "for " from the beginning of a string
	$title =~ s/[\s]from[\s]//g;											# This regular expression removes " from ".
	$title =~ s/^from[\s]//g;												# This regular expression removes "from " from the beginning of a string
	$title =~ s/[\s]in[\s]//g;												# This regular expression removes " in ".
	$title =~ s/^in[\s]//g;													# This regular expression removes "in " from the beginning of a string
	$title =~ s/[\s]of[\s]//g;												# This regular expression removes " of ".
	$title =~ s/^of[\s]//g;													# This regular expression removes "of " from the beginning of a string
	$title =~ s/[\s]on[\s]//g;												# This regular expression removes " on ".
	$title =~ s/^on[\s]//g;													# This regular expression removes "on " from the beginning of a string
	$title =~ s/[\s]or[\s]//g;												# This regular expression removes " or ".
	$title =~ s/^or[\s]//g;													# This regular expression removes "or " from the beginning of a string
	$title =~ s/[\s]out[\s]//g;												# This regular expression removes " out ".
	$title =~ s/^out[\s]//g;												# This regular expression removes "out " from the beginning of a string
	$title =~ s/[\s]the[\s]//g;												# This regular expression removes " the ".
	$title =~ s/^the[\s]//g;												# This regular expression removes "the " from the beginning of a string
	$title =~ s/[\s]to[\s]//g;												# This regular expression removes " to ".
	$title =~ s/^to[\s]//g;													# This regular expression removes "to " from the beginning of a string
	$title =~ s/[\s]with[\s]//g;											# This regular expression removes " with ".
	$title =~ s/^with[\s]//g; 												# This regular expression removes "with " from the beginning of a string
#	print "after ->$title\n";												# Prints $title after regular expressions have been applied.
	if ($title =~ s/.*[^\x00-\x7F].*/\s/ || $title =~ m//) {				# Doesn't allow song titles with foreign characters through.
	}
	else {																	
		push @data, $title;																		# Pushes song title to a data array for preliminary checking.
		(@word) = split /\s/, $title;															# Splits title in to words so that it can be sorted.
		for (my $k = 0; $k < scalar @word -1; $k++) {											# Goes through and populates @words with bigram counts.
			if ($words[$k+1] !~ m/.*[\s]/ ||  $words[$k+1] !~ m/\s/ || $words[$k+1] != NULL){	# if statement to increment if one of the bigrams already exists.
				if ($words{$word[$k]}{$word[$k+1]} != 0) {
					$words{$word[$k]}{$word[$k+1]}++;
				}
				else {																			# else statement to instantiate a bigram for a new bigram found.
					$words{$word[$k]}{$word[$k+1]} = 1;
				}
			}
		}
	}
}

#foreach my $key1 (keys %words) {																# This nested for each loop goes through each bigram found and gives
#	foreach my $key2 (keys %{%words{$key1}}) {													#   the count found for each one of the bigrams. Mainly used for 
#		print "$key1 -> $key2 = %{$words{$key1}{$key2}} \n";									#	testing purposes to check correctness.
#	}																							#			
#}																								#

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
	if ($input =~ m/q/) {																		# If the user has entered the input to be "q" then exit the program.
		exit 0;																					# exit 0 exits the program	
	}
	else {																						# This else statement is for if the user has entered something other than "q".
		push(@checker, $input);																	# @push(@checker, $input) This first push will push the users input to the checker array
																								#	so that it can be used for the pattern recognition and later the resultant song title
																								#	generated.
		while ($input ne NULL) { 																# This while loop reads the user input and then prints out the next most common																		#   word that follows the given word. It will loop until mcw gives a NULL value 
			$input = mcw($input);																#	stating that the song name has been full generated.
			push(@checker,$input);																# @push(@checker,$input); This will push the generated word for the song title
																								#	to the checker array that will be used as the pattern recognition and result for
																								#	final generated song name.
			if ($counter >= 3) {																# @if ($counter >= 3) Is used to allow the checker array to be filled up 3 times before
																								#	the pattern recognition will start to check the latest word generated and the 
																								#	word that is 2 places behind the latest word generated to see if they match. If they
																								#   match then it will print out final result of the generated name and let you know a
																								# 	pattern has been detected and will exit the while loop.
					my $t3 = pop @checker;														# @my $t3.... This will pop the latest word generated from mcw to be used for pattern recognition.
					my $t2 = pop @checker;														# @my $t2.... This will pop the word previously generated from mcw so that the word behind it can 
																								#	can be used.
					my $t1 = pop @checker;														# @my $t1.... This will pop the word located 2 places behind the latest generated word so that it
																								#	can then check the latest word generated and this word and see if there is a match. 
					if ($t1 eq $t3) {															# @if ($t1 eq $t3) This is the pattern recognition that will officially check to see if there is
																								#	is a pattern that has formed while generating the desired song title. It checks by checking if
																								#	the latestest and 2 words behind the latest word generated are the same. If they are the same
																								#	there will be a pattern as well as a loop between these two words so it will go on indefinitely
																								# 	otherwise. So instead it exits the loop and prints out the resultant song title.
						print"\n";	
						push(@checker, $t1);													# @push.... This push will push the 2nd to last word back onto the checker array so that it will
																								#	be printed with the resulting generated song title.
						print "Generated Name: @checker \n";									# @print... This prints out the generated song title from the checker array up to the first pattern iteration.
						print "Pattern found..... Exiting.";									# @print... Lets you know that a pattern has been found and it will be exiting the while loop.
						$input = NULL;															# Sets $input to NULL so that it will exit the while loop and prompt the user for the next word to use to 
																								#	to generate.
					}
					else {
						push(@checker, $t1);
						push(@checker, $t2);
						push(@checker, $t3);
					}
			}
		}
		print "\n";
		@checker =();																			# Re instantiates the checker array so that it can be used for the next user given
																								#	word to generate a song name with.
		print "Enter a word [Enter 'q' to quit]: ";											    # Asks the user if there is another string they want to use to generate a song name with.
		$input = <STDIN>;
		chomp($input);
		print "\n";
	}
}

sub mcw{																						#@sub mcw{} This method is the method used to give the next most common word following given string.
	my $count = 0;																				# @count is used to compare pairs of words to figure out the most common word following given string.																				
	$string = $_[0];																			# Reads in first given string into function which is the users input.
	my $followingString;																		# @followingString is the string that is returned which is the most common word following given string.
	if (%words{$string} == 0 || m/"\s"/) {														# This statement will return NULL if the most common word following the string is invalid.
		return NULL;
	}
	else {																						# This else statement is to be used to generate song name for the user input
		foreach my $keySet2 (keys %{%words{$string}}) {											#	beginning word. It will read through and determine the most common  
			if ($count < $words{$string}{$keySet2}) {											#	following string for the input name by comparing bigram counts.
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


