#takes correlation matrix gives pcst cost input file for mdmso and hdmso


use strict;
use warnings;

my @array1;
my @array2;

open (my $inFile, '<', 'corrlation-mdmso.txt') or die $!;
my $header= <$inFile>;
my $header2= <$inFile>;
my $header3= <$inFile>;
while (<$inFile>) {

  push(@array1,split /\n/);
}
close ($inFile);

my @header=(split /\s/, $header3); 

print $#header-2;
print $#array1;


my $output_file="mdmso-cost-input.txt";
open(OUTPUT,">".$output_file);

for (my$i=0; $i < $#array1+1; $i+=1) {

my @val = split /\s/, $array1[$i];
	for (my$el=$i+1; $el < $#val; $el+=1){
		
		print OUTPUT "$header[$i+2]	$header[$el+2]	$val[$el+1]	U\n";

			
	}
}
close (OUTPUT);

