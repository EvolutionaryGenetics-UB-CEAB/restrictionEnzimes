# Evaluating restriction enzyme selection for genome reduction in non-model organisms
## Getting started
This repository contains all the supplementary pipelines about the research called: **Evaluating restriction enzyme selection for genome reduction in non-model organisms my final degree project**. 

## Documentation
Supplementary information of in-house scripts
- **extractFastaFromList.py**: This script uses a fasta file with all the DNA sequences and a list of the selected loci. It extracts the corresponding sequence for each gene and creates a new fasta file with the selected loci and its corresponding sequence. 
- **ClassifyBlastOut.py**: This script is used after using makeblast db. With makeblast db, we obtain the hits of our loci in the reference genome, meaning we obtain the number of loci mapping and not mapping. However, we do not know where are located the mapped loci. ClassifyBlastOut.py allows us to obtain the classification of mapped loci in genes (exons, introns) and intergenic regions by using blast output and the GFF file. 
- **Longestprotein.py**: This script allows us to obtain a fasta file including the longest amino-acid sequence for each selected gene. It is coded in two main steps: the first one calculates the length of all proteins of the reference genome; the second one reads the list of mapped genes and finds identifiers of proteins corresponding to each gene thanks to the Gene ID-Protein ID file. Not only that, but it also selects the longest protein for each gene and writes the fasta sequence in an output file.
- **eggnog_genes2gov2.py**: This script allows obtaining a list with the ID protein and the GO terms associated with the output file of eggnog. 
integrateEggNOG.py: This script integrates all the information obtained in previous processes. It needs the classification output file, a .txt file with protein and gene IDs, and the output file from eggnog_genes2gov2.py. With these files, we finally obtain an output file with four columns: loci of the analyzed species, gene ID from reference species, protein ID from reference species and GO terms.


