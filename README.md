# Evaluating restriction enzyme selection for genome reduction in non-model organisms
## Getting started
This repository contains all the supplementary information about my final degree project: all the pipelines, the scripts used for statistical analyses, 
the supplementary tables and the supplementary information of GO terms from REVIGO (http://revigo.irb.hr/). 

## A little introduction
My final degree project is based on the importance of using restriction enzymes in population genomics. We have studied four non-model species
characteristic from the Mediterranean Sea: *Symphodus ocellatus, Symphodus tinca, Paracentrotus lividus* and *Arbacia lixula.* 
In order to do that we studied the location in a reference genome of total and candidate loci, as well as, we performed a functional analysis of the
loci mapping to know if they shared a function. 

## Documentation
- **symphodus.sh**: This pipeline was the one used for the analyses of *S. ocellatus* and *S. tinca*. It contains all the functions to obtain the location of
loci in the reference genome, how to use the candidate list to also analyze candidate loci, and the in-house scripts used. However, some of them are found
in the other repository (classifyBlastOut). It also has the specific version used of the reference genome used, and the software used, such as eggnog. 
- **arbaciaparacentrotus.sh**: This pipeline was the one used for the analyses of *P. lividus* and *A. lixula*. It contains the information of all the functions used
for obtaining the number of loci mapping, and its classification in exons, introns or intergenic regions. Moreover, it also contains the functional analysis and
the parameters used. 
- **crosstabs.R**: This is the pipeline used for the statistical analyses of our data. It contains all the tests realized and the indication of what is being analyzed.
For example, we analyzed if there was significance between candidate and total loci of *S. ocellatus*, so you can see the comparision tested and the statistical
method used. 
- **supplementary_information.xlsx**: This Excel contains all the supplementary information about the biological processes GO terms analyzed 
in the four species, their name and the representative of each group. 

## Support
If you have a doubt of any file, you can email me in: ainhoa14ainhoa@gmail.com

## Authors and acknowledgment
I am grateful for the support of my two tutors, Marta Pascual and Cinta Pegueroles, because they showed me a new world inside genomics and genetics. 
I also want to thank all the team of Evolutionary Genetics of University of Barcelona for welcoming me and sharing all their knowledge and data, 
which has been very useful for this project.


