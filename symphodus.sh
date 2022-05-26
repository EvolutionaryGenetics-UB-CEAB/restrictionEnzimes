#Analyses of the location of loci in Symphodus ocellatus and Symphodus tinca
cd /piec1/mpascual/alopez
echo "running script for Ocellatus"
grep -v '#' /piec1/mpascual/alopez/41598_2020_69160_MOESM4_OC.vcf |cut -f3 |sed 's/^/CLocus_/' > /piec1/mpascual/alopez/loci_OC.list
#to obtain our file with loci and their respective sequence we use a in-house script (extractFastaFromList.py)
python /piec1/c.pegueroles/python/3.5/extractFastaFromList.py /piec1/mpascual/alopez/batch_1_Soc.loci.fa loci_OC.list loci_OC.fa


echo "done"
grep 'CLocus_' loci_OC.list |wc -l 
grep 'CLocus_' loci_OC.fa |wc -l
grep 'CLocus_' loci_OC.list loci_OC.fa |wc -l

#Checking if there are all the loci
grep -w  -v -f found.list candidatsocellatusdef.list
#this is the list of loci missing
#>CLocus_1207
#>CLocus_1945
#>CLocus_3126
#>CLocus_9916
#>CLocus_27087
#>CLocus_31683
#>CLocus_32644
grep -w  -v -f found.list candidatsocellatusdef.list |sed 's/>//' > missingOC.list
python /piec1/c.pegueroles/python/3.5/extractFastaFromList.py /piec1/mpascual/alopez/Soc_snp_loci_seq.fa missingOC.list missinglistOCdef.fa
cat missinglistOCdef.fa  
#We put together the two files to obtain the final sequences (fasta file)
cat missinglistOCdef.fa loci_OC.fa > OC_def.fa
grep -w -f candidatsocellatusdef.list OC_def.fa |head   
grep -w -f candidatsocellatusdef.list OC_def.fa |wc -l
grep ">" OC_def.fa |wc -l
#3985
#We blastn the sequences with the reference genome (Labrus berbylta)

#qsub -pe make 1 -l h_vmem=100G /piec1/mpascual/alopez/blastv2.sh
#/home/soft/blast-2.10.1/bin/makeblastdb -in /Users/ainhoalopez/Documents/TFG/GCF_900080235.1_BallGen_V1_genomic.fna -dbtype nucl 
#the last command only has to be done one time (the genome has to be unziped)
#/home/soft/blast-2.10.1/bin/blastn -query /piec1/mpascual/alopez/OC_def.fa -db /piec1/mpascual/alopez -outfmt 6 -evalue 1e-4 -out  /piec1/mpascual/alopez/blastOC.out

#Recount of total matches with the genomerecuento total de los matches con el genoma
cut -f1 blastOC.out |sort| uniq|wc -l #423
#Counting the ones that are uniq 
cut -f1 blastOC.out|sort|uniq -c |grep ' 1 ' |wc -l #352
#Counting the ones repeated
cut -f1 blastOC.out|sort|uniq -c |grep -v ' 1 ' |wc -l #71
grep ">" OC_def.fa |wc -l #total: 3985

#by using anin-house script we localise the hits (or matches). Exons, introns or intergenic regions.
qsub -pe make 1 -l h_vmem=100G /piec1/mpascual/alopez/pytonOC.sh
#source /home/usuaris/mpascual/gffutils/bin/activate
#python /piec1/c.pegueroles/python/3.5/classifyBlastOut.py -b /piec1/mpascual/alopez/blastOC.out -g /piec1/dades/genomes/lbergylta/GCF_900080235.1_BallGen_V1_genomic.gff.gz -o /piec1/mpascual/alopez/probaOCpy.out


#We can verify the mapped with the number obtained previously with the blast. 
#Maped and unmapped
 ##TOTAL
cut -f1 blastOC.out |sort| uniq|wc -l #423 maped
grep ">" OC_def.fa |wc -l #total: 3985
cut -f1 blastOC.out |sort| uniq >MAPEADOSOCV1.list
grep -w -v -f MAPEADOSOCV1.list OC_def.fa |grep '>'|wc -l #3562 
 #unmapped= 3985-423= 3562

 ##CANDIDATES
cut -f1 blastOC.out |sort| uniq| grep -w -f candidatsOCcomparacio.list |wc -l #26 mapeados 
wc -l candidatsOCcomparacio.list #292
 #unmapped= 292-26=266

#Uniqs and repeated
 ##TOTAL
cut -f1 blastOC.out|sort|uniq -c |grep ' 1 ' |wc -l #352 uniq
cut -f1 blastOC.out|sort|uniq -c |grep -v ' 1 ' |wc -l #71

 #Extraemos la lista de los unicos
cut -f1 probaOCpy.out |sort|uniq -c | grep ' 1 ' |sed 's/      1 //' > uniqOC.list
 ##CANDIDATES
 #we modify the list in order to compare it
sed 's/>//' candidatsocellatusdef.list|head
sed 's/>//' candidatsocellatusdef.list > candidatsOCcomparacio.list

cut -f1 blastOC.out|sort|uniq -c |grep ' 1 ' |grep -w -f candidatsOCcomparacio.list | wc -l #22 uniq
cut -f1 blastOC.out|sort|uniq -c |grep -v ' 1 ' |grep -w -f candidatsOCcomparacio.list | wc -l #4

#Gene-intergenic
 ##TOTAL
grep -w -f uniqOC.list probaOCpy.out| grep 'gene' | wc -l #206 gene
grep -w -f uniqOC.list probaOCpy.out| grep 'intergenic' | wc -l #146

 ##CANDIDATES
grep -w -f uniqOC.list probaOCpy.out| grep 'gene' | grep -w -f candidatsOCcomparacio.list |wc -l #16 gene
grep -w -f uniqOC.list probaOCpy.out| grep 'intergenic' | grep -w -f candidatsOCcomparacio.list |wc -l #6

#Exon-intron
 ##TOTAl
grep -w -f uniqOC.list probaOCpy.out| grep 'exon' | wc -l #58
grep -w -f uniqOC.list probaOCpy.out| grep 'intron' | wc -l #148
grep -w -f uniqOC.list probaOCpy.out| grep 'exon' | grep 'intron' |wc -l #4 
#the loci mapping in exons and introns are only counted as exons. Intron total= 148-4= 144

grep -w -f uniqOC.list probaOCpy.out|grep 'gene' |grep  -v 'exon\|intron' #we search the genes without intron and exon annotation
#We obtain 4 genes, we check if there are pseudogenes
gunzip -c /piec1/dades/genomes/lbergylta/GCF_900080235.1_BallGen_V1_genomic.gff.gz|  grep 'LOC109986035\|LOC110002752\|LOC109982300\|LOC110003033' |grep 'pseudogene'

#If they are pseudogenes: we include them inside genes. 
#This pseudogenes are classified in: 3 exons and 1 intron. #61 exons i 145 introns

 ##CANDIDATES
grep -w -f uniqOC.list probaOCpy.out| grep 'exon' | grep -w -f candidatsOCcomparacio.list |wc -l #3
grep -w -f uniqOC.list probaOCpy.out| grep 'intron' | grep -w -f candidatsOCcomparacio.list |wc -l #14
grep -w -f uniqOC.list probaOCpy.out| grep 'exon' | grep 'intron'| grep -w -f candidatsOCcomparacio.list |wc -l #1
#introns total= 14-1= 13

#To use IGV we convert the file in "bed"
/piec1/c.pegueroles/soft/blast2bed-master/blast2bed blastOC.out 


echo "running script for Tinca"
grep -v '#' /piec1/mpascual/alopez/41598_2020_69160_MOESM6_T.vcf |cut -f3 |sed 's/^/CLocus_/' > /piec1/mpascual/alopez/loci_T.list
python /piec1/c.pegueroles/python/3.5/extractFastaFromList.py /piec1/mpascual/alopez/batch_1_St.loci.fa loci_T.list loci_T.fa

grep 'CLocus_' loci_T.list |wc -l 
grep 'CLocus_' loci_T.fa |wc -l
grep 'CLocus_' loci_T.list loci_T.fa |wc -l
echo "done"

grep -w -v -f foundtinca.list candidatstincadef.list |sed 's/>//' > missingT.list
python /piec1/c.pegueroles/python/3.5/extractFastaFromList.py /piec1/mpascual/alopez/St_snp_loci_seq.fa missingT.list missinglistTdef.fa
head missinglistTdef.fa
#we put together the files
cat missinglistTdef.fa loci_T.fa > T_def.fa
head T_def.fa
grep -w -f candidatstincadef.list T_def.fa |head
grep -w -f candidatstincadef.list T_def.fa |wc -l
grep ">" T_def.fa |wc -l
#5284

#/home/soft/blast-2.10.1/bin/blastn -query /piec1/mpascual/alopez/T_def.fa -db /piec1/mpascual/alopez -outfmt 6 -evalue 1e-4 -out  /piec1/mpascual/alopez/blastT.out
#Counting the hits and the uniq and repeated

cut -f1 blastT.out |sort| uniq|wc -l #512

cut -f1 blastT.out|sort|uniq -c |grep ' 1 ' |wc -l #420
cut -f1 blastT.out|sort|uniq -c |grep -v ' 1 ' |wc -l #92
grep ">" T_def.fa |wc -l #total 5284

#python to find the location of loci
qsub -pe make 1 -l h_vmem=100G /piec1/mpascual/alopez/pytonTINCA.sh
#source /home/usuaris/mpascual/gffutils/bin/activate
#python /piec1/c.pegueroles/python/3.5/classifyBlastOut.py -b /piec1/mpascual/alopez/blastT.out -g /piec1/dades/genomes/lbergylta/GCF_900080235.1_BallGen_V1_genomic.gff.gz -o /piec1/mpascual/alopez/probaT.out

#Recounting
#mapped y unmapped
 ##TOTAL
cut -f1 blastT.out |sort| uniq|wc -l #512 mapped
grep ">" T_def.fa |wc -l #total 5284
 #unmapped= 5284-512= 4772

 ##CANDIDATES
cut -f1 blastT.out |sort| uniq| grep -w -f candidatsTcomparacio.list |wc -l #11 mapped
wc -l candidatsTcomparacio.list #168 total
 #unmapped= 168-11= 157

#Uniqs and repeated
 ##TOTAL
cut -f1 blastT.out|sort|uniq -c |grep ' 1 ' |wc -l #420 uniq
cut -f1 blastT.out|sort|uniq -c |grep -v ' 1 ' |wc -l #92
 #extraemos lista de unicos
cut -f1 probaT.out |sort|uniq -c | grep ' 1 ' |sed 's/      1 //' > uniqT.list
 
 ##CANDIDATES
sed 's/>//' candidatstincadef.list > candidatsTcomparacio.list

cut -f1 blastT.out|sort|uniq -c |grep ' 1 ' |grep -w -f candidatsTcomparacio.list | wc -l #9
cut -f1 blastT.out|sort|uniq -c |grep -v ' 1 ' |grep -w -f candidatsTcomparacio.list | wc -l #2

#Gene-intergenic
 ##TOTAL
grep -w -f uniqT.list probaT.out| grep 'gene' | wc -l #261 gene
grep -w -f uniqT.list probaT.out| grep 'intergenic' | wc -l #159

 ##CANDIDATES
grep -w -f uniqT.list probaT.out| grep 'gene' | grep -w -f candidatsTcomparacio.list |wc -l #7
grep -w -f uniqT.list probaT.out| grep 'intergenic' | grep -w -f candidatsTcomparacio.list |wc -l #2

#Exon-intron
 ##TOTAl
grep -w -f uniqT.list probaT.out| grep 'exon' | wc -l #63
grep -w -f uniqT.list probaT.out| grep 'intron' | wc -l #197
grep -w -f uniqT.list probaT.out| grep 'exon' | grep 'intron' |wc -l #3
#introns total= 197-3= 194
grep -w -f uniqT.list probaT.out| grep 'gene'|grep  -v 'exon\|intron' #searching for the genes without annotation of exons or introns
#We analyzed if these genes are pseudogenesObtenemos 4 genes miramos si son pseudogenes
gunzip -c /piec1/dades/genomes/lbergylta/GCF_900080235.1_BallGen_V1_genomic.gff.gz|  grep 'LOC109999655\|LOC109995444\|LOC109995740\|LOC109991283' |grep 'pseudogene'

 Dentro de estos pseudogenes hay 3 exons y 1 intron #66 exons i 195 introns

 ##CANDIDATES
grep -w -f uniqT.list probaT.out| grep 'exon' | grep -w -f candidatsTcomparacio.list| wc -l #3
grep -w -f uniqT.list probaT.out| grep 'intron' | grep -w -f candidatsTcomparacio.list| wc -l #4
grep -w -f uniqT.list probaT.out| grep 'exon' | grep 'intron' |grep -w -f candidatsTcomparacio.list|wc -l #0

#To use IGV we convert the file in "bed"
/piec1/c.pegueroles/soft/blast2bed-master/blast2bed blastT.out



echo "running for functional enrichment Labrus bergylta"
#we need proteins in CSV of NCBI from the reference genome
cut -f7,9 GCF_900080235.1_BallGen_V1_annotations.txt > geneID_protID_LB.txt

#We will only used the mapped genes so we do a list of them
grep 'gene' probaOCpy.out |cut -f14 |sed 's/\t/\n/g' |grep 'gene' |sed 's/gene-//'|sort|uniq > mapped_gene_OC.list
grep 'gene' probaT.out |cut -f14 |sed 's/\t/\n/g' |grep 'gene' |sed 's/gene-//'|sort|uniq > mapped_gene_T.list


#script to obtain the longest protein
python /piec1/c.pegueroles/python/3.5/longestProteinFromFasta.py /piec1/mpascual/alopez/GCF_900080235.1_BallGen_V1_protein.faa.gz /piec1/mpascual/alopez/mapped_gene_OC.list /piec1/mpascual/alopez/geneID_protID_LB.txt /piec1/mpascual/alopez/mappedGenes_longestProtOC.fa
python /piec1/c.pegueroles/python/3.5/longestProteinFromFasta.py /piec1/mpascual/alopez/GCF_900080235.1_BallGen_V1_protein.faa.gz /piec1/mpascual/alopez/mapped_gene_T.list /piec1/mpascual/alopez/geneID_protID_LB.txt /piec1/mpascual/alopez/mappedGenes_longestProtT.fa

#Filters and eggnog version
#Proteins, Chrodata, one-to-one orthology, non-electronic, report PFAM, skip SMART annotation
#Version 5.0 eggnog, eggnog-mapper v2, emapper-2.1.6

#we want the XP with the GO terms. We use an in-house script of python. 

python /piec1/c.pegueroles/python/3.5/eggNOG_gene2gov2.py  /piec1/mpascual/alopez/out.emapper.OCOP3.annotations  /piec1/mpascual/alopez/lb2goOCdef.txt #802 GO out.emapper.OCOP3
python /piec1/c.pegueroles/python/3.5/eggNOG_gene2gov2.py  /piec1/mpascual/alopez/out.emapper.TOP3.annotations /piec1/mpascual/alopez/lb2goTdef.txt #758 GO out.emapper.OCOP3


#We put together the XP and GO terms wiht the loci and the name of genes of S. ocellatus and S. tinca
python /piec1/c.pegueroles/python/3.5/integrateeggNOG.py /piec1/mpascual/alopez/probaOCpy.out /piec1/mpascual/alopez/geneID_protID_LB.txt /piec1/mpascual/alopez/lb2goOCdef.txt /piec1/mpascual/alopez/Ocellatus_Lbergyltadef.out #139 gens
python /piec1/c.pegueroles/python/3.5/integrateeggNOG.py /piec1/mpascual/alopez/probaT.out /piec1/mpascual/alopez/geneID_protID_LB.txt /piec1/mpascual/alopez/lb2goTdef.txt /piec1/mpascual/alopez/Tinca_Lbergyltadef.out #179 gens


#we really need the loci and GO terms
cut -f1,4 Ocellatus_Lbergyltadef.out > genes2go_ocellatus.out
cut -f1,4 Tinca_Lbergyltadef.out > genes2go_tinca.out

cut -f1 genes2go_ocellatus.out |sort|uniq > allOC.list
cut -f1 genes2go_tinca.out |sort|uniq >allT.list
cat genes2go_ocellatus.out genes2go_tinca.out > genes2go_total.out


#Checking if the enrichment analysis is logic
grep 'gene' probaOCpy.out |cut -f1| sort|uniq|wc -l #264
grep 'gene' probaOCpy.out |cut -f1| sort|uniq -c|grep ' 1 '|wc -l #222
cut -f1 Ocellatus_Lbergyltadef.out|sort|uniq| wc -l #139
grep -w -f candidatsOCcomparacio.list allOC.list| wc -l #9


grep 'gene' probaT.out|cut -f1| sort|uniq|wc -l #335
grep 'gene' probaT.out |cut -f1|sort|uniq -c| grep ' 1 '| wc -l #276
cut -f1 Tinca_Lbergyltadef.out|sort|uniq| wc -l #179
grep -w -f candidatsTcomparacio.list allT.list| wc -l #4

#REVIGOv2

	#S.Ocellatus
awk '{if(/[0-9]+\sGO/) print $2}' genes2go_ocellatus.out |sort|uniq -c|grep ' 3 '|sed 's/GO/\tGO/'|cut -f2 >3awkgotermsOC.txt
awk '{if(/[0-9]+\sGO/) print $2}' genes2go_ocellatus.out |sort|uniq -c|grep ' 4 '|sed 's/GO/\tGO/'|cut -f2 >4awkgotermsOC.txt
awk '{if(/[0-9]+\sGO/) print $2}' genes2go_ocellatus.out |sort|uniq -c|grep ' 5 '|sed 's/GO/\tGO/'|cut -f2 >5awkgotermsOC.txt
cat 3awkgotermsOC.txt 4awkgotermsOC.txt 5awkgotermsOC.txt > 3,4,5awkgotermsOC.txt

awk '{if(/[0-9]+\sGO/) print $2}' genes2go_ocellatus.out| sort|uniq -c| grep -v ' 1 '|grep -v ' 2 '|grep -v ' 3 '|grep -v ' 4 ' |grep -v ' 5 '> awkGOtermsOCv5.txt

	#S.Tinca
	
awk '{if(/[0-9]+\sGO/) print $2}' genes2go_tinca.out |sort|uniq -c|grep -v ' 1 '|grep -v ' 2 '|grep -v ' 4 '|grep -v ' 3 '|grep -v ' 5 '|sed 's/GO/\tGO/'|cut -f2 >awkgotermsT5.txt

awk '{if(/[0-9]+\sGO/) print $2}' genes2go_tinca.out |sort|uniq -c|grep ' 3 '|sed 's/GO/\tGO/'|cut -f2 >3awkgotermsT.txt
awk '{if(/[0-9]+\sGO/) print $2}' genes2go_tinca.out |sort|uniq -c|grep ' 4 '|sed 's/GO/\tGO/'|cut -f2 >4awkgotermsT.txt
awk '{if(/[0-9]+\sGO/) print $2}' genes2go_tinca.out |sort|uniq -c|grep ' 5 '|sed 's/GO/\tGO/'|cut -f2 >5awkgotermsT.txt
cat 3awkgotermsT.txt 4awkgotermsT.txt 5awkgotermsT.txt > 3,4,5awkgotermsT.txt



