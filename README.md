# network-utilities
Describes  codes I used for generation of PCST networks

pcst-input-prize.pl takes fold change values from edgeR as matrix for multiple samples and generates pcst cost input file using gene names from ensembl resource, ensembl gene id remains. Resulting files can be directly used as omics integrater forest inputs.

prpare-network.pl takes string network.node.attr file to convert it gene names generating gene to gene networks to be used as input for Omics integrator

centrality_networkx.py Networkx.py calculates network degree stats for a .sif file using networkx package.


