#this code takes edgeR results and the ensemblid to gene name list gives PCST prize file 

use strict;
use warnings;

my @bait;
my @prey;
my @array2;

#ensemblids and corresponding gene symbols is in ensembl2gene file 
open (my $inFile2, '<', 'ensembl2gene.txt') or die $!;

while (<$inFile2>) {
	
	push(@array2,split /\s/);
}
close ($inFile2);

# print $array2[1];

for (my$i=0; $i < $#array2+1; $i+=2) { push (@bait, $array2[$i]) };

for (my$i=1; $i < $#array2+1; $i+=2) { push (@prey, $array2[$i]) }; 

# print "$bait[0]	$prey[0]\n";


my %hash;
for (my$i=0; $i < $#bait+1; $i+=1){

$hash{$bait[$i]} = $prey[$i];

}

#open the directory set sequenally read the txt files 
my $directory = "C:/strawberry/perl/bin/set/";
opendir DIR, $directory ;
my @files = grep{ /\.txt/} readdir (DIR) ;
closedir DIR;

#foreach file do
foreach my $file (@files)
{
	my (@mydata);
	
	#open a output file foreach input file
	my $output_file="prize.$file.txt";
	open(OUTPUT,">".$output_file);
	
    open (IN, $directory.$file);
	my $headline= <IN>;
	
    while (<IN>)

        {
        chomp;
		
		#break the files into lines and foreach line find ensemblid match 
		#them to the equal equal ensebl and to the fold change values
		#to change fold change into pvalue or something else look $mydata
		
        my @lines = split (/\n/,$_) ;
		foreach my $el (@lines){
		
		# print "$el\n";
		@mydata = split (/\,/,$el) ;
		# print "$mydata[1]\n";
			foreach my $key (@bait){
			# print "$key\n";
				if ( index($el, $key) != -1){
				
				print OUTPUT "$hash{$key}	$mydata[1]\n";
				
				}
				}
		}
		}
		
close (OUTPUT);
close(IN);

}














