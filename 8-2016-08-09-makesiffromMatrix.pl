#takes tge gene list and correlation matrix outputs sif file with corr>0.95


use strict;
use warnings;

my @array1;
my @array2;

open (my $inFile, '<', 'corr-mdmso.txt') or die $!;
while (<$inFile>) {

  push(@array1,split /\n/);
}
close ($inFile);

open (my $inFile2, '<', 'genes.txt') or die $!;
while (<$inFile2>) {

  push(@array2,split /\n/);
}
close ($inFile2);


my $output_file="corr-r-mdmso-2.txt";
open(OUTPUT,">".$output_file);


for (my$i=2; $i < $#array1+1; $i+=1) {

my @val = split /\s/, $array1[$i];
for (my$el=$i; $el < $#val+1; $el+=1){
if( $val[$el]>0.99){
print OUTPUT "$array2[$i-2]	$val[$el]	$array2[$el-1]\n";

}
}
}

