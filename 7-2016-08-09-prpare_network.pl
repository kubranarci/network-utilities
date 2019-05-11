#this code takes edge and node attr files of coexpnet and gives siff file with gene names

use strict;
use warnings;

my @node;
my @gen;
my @array1;
open (my $inFile, '<', 'network.node.attr') or die $!;
while (<$inFile>) {

  push(@array1,split /\t/);
}
close ($inFile);

for (my$i=0; $i < $#array1+1; $i+=10) { push (@node, $array1[$i]) };

for (my$i=1; $i < $#array1+1; $i+=10) { push (@gen, $array1[$i]) }; 

my %hash;
for (my$i=0; $i < $#node+1; $i+=1){

$hash{$node[$i]} = $gen[$i];

}

print $hash{$node[1]};

# print $node[2];

my @array2;
my @bait;
my @prey;
my @corr;
open (my $inFile2, '<', 'network.edge.attr') or die $!;
while (<$inFile2>) {

  push(@array2,split /\s/);
}
close ($inFile2);

for (my$i=0; $i < $#array2+1; $i+=4) { push (@bait, $array2[$i]) };

for (my$i=2; $i < $#array2+1; $i+=4) { push (@prey, $array2[$i]) }; 

for (my$i=3; $i < $#array2+1; $i+=4) { push (@corr, $array2[$i]) }; 


my $output_file="mdmso-network.txt";
open(OUTPUT,">".$output_file);

for (my $i=0; $i < $#bait+1; $i+=1){

my $a = $hash{$bait[$i]};
my $b = $hash{$prey[$i]};
print OUTPUT "$a	$corr[$i]	$b\n";

}














