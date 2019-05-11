import networkx as nx
import sys
#g = nx.read_edgelist("/Users/kubra/Desktop/PHD/HALPHA_optimalForest.sif",create_using=None, delimiter='\tpp\t', nodetype=str, data=True, edgetype=None, encoding='utf-8')

output_file= str("deneme.txt")

sys.stdout=open(output_file,"w")

#degree_c = nx.degree_centrality(g)
#pageR = nx.pagerank(g)
#eigen_c = nx.eigenvector_centrality(g)
#closeness_c = nx.closeness_centrality(g)
#betweenness_c = nx.betweenness_centrality(g)

#print((str(node)  + '\t'+ str(degree_c[node])  + '\t'+ pageR[node]  + '\t'+ closeness_c[node]  + '\t'+ betweenness_c[node] +'\n') for node in degree_c)
