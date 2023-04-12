# Evaluating restriction enzyme selection for genome reduction in non-model organisms
## Getting started
This repository contains all the supplementary pipelines about the research called: **Evaluating restriction enzyme selection for genome reduction in non-model organisms.**

## Documentation
Supplementary information of in-house scripts 
- **ClassifyBlastOut.py**: This script is used after using makeblast db. With makeblast db, we obtain the hits of our loci in the reference genome, meaning we obtain the number of loci mapping and not mapping. Then we dive the mapped loci in unique and repeated loci and we work with the unique loci. However, we do not know where they are. ClassifyBlastOut.py allows us to obtain the classification of unique mapped loci in genes (exons, introns) and intergenic regions by using blast output and the GFF file. 
- **eggnog_genes2gov2.py**: This script allows obtaining a list with the ID protein and the GO terms associated with the output file of eggnog. 
integrateEggNOG.py: This script integrates all the information obtained in previous processes. It needs the classification output file, a .txt file with protein and gene IDs, and the output file from eggnog_genes2gov2.py. With these files, we finally obtain an output file with four columns: loci of the analyzed species, gene ID from reference species, protein ID from reference species and GO terms.


