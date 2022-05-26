
#We need the candidate loci from the paper of A. lixula
cut -f2,3 Supp_Mat_3_Loci_info.txt |grep 'Outlier'|cut -f1> outliers_arbacia.txt
cut -f2,4 Supp_Mat_3_Loci_info.txt |grep 'YES'|cut -f1 >RAD_loci_arbacia.txt
grep -v '311673' outliers_arbacia.txt|grep -v '384805'|grep -v '2355128'|grep -v '4903638'> outliers_perajuntar.txt
cat outliers_perajuntar.txt RAD_loci_arbacia.txt > candidates_paper.list #264


#cd /piec1/mpascual/d.huerta/arbacia/maping/allids
#Arbacia lixula
#mapped y unmapped
	#Total
cut -f1 arbacia_maped.out|sort|uniq|wc -l #174
cut -f1 arbacia_maped.out | sort|uniq > mapedAR.list
grep -w -f /piec1/mpascual/d.huerta/arbacia/maping/allids/mapedAR.list arbacia_id.csv |wc -l #174
grep -w -v -f /piec1/mpascual/d.huerta/arbacia/maping/allids/mapedAR.list arbacia_id.csv |wc -l #5067
#total= 5241
#unmapped= 5241-174= 5067

	#Candidates
cut -f1 arbacia_maped.out|sort|uniq| grep -w -f candidates_paper.list |wc -l #6
wc -l candidates_paper.list #264
grep -w -v -f candidats_mapejats.list candidates_paper.list |wc -l #no mapejats: 258	

#Uniqs and repeated
#uniqs list
cut -f1 arbacia_maped.out|sort|uniq -c |grep ' 1 ' |sed 's/      1 //' > uniqAR.list
	#TOTAL
cut -f1 arbacia_maped.out|sort|uniq -c |grep ' 1 ' |wc -l #88 uniqs
cut -f1 arbacia_maped.out|sort|uniq -c |grep -v ' 1 ' |wc -l #86 repeated
	#CANDIDATES
cut -f1 arbacia_maped.out|sort|uniq -c|grep ' 1 '| grep -w -f candidates_paper.list |wc -l #2 uniqs
cut -f1 arbacia_maped.out|sort|uniq -c|grep -v ' 1 '| grep -w -f candidates_paper.list |wc -l #4 repeated

#Gene and intergene
	#Total
grep -w -f uniqAR.list arbacia_maped.out| grep 'gene'|wc -l #0
#if we add the loci that mapped in exons and introns we can obtain the ones localised in genes: 63
grep -w -f uniqAR.list arbacia_maped.out| grep 'intergenic'|wc -l #25
	
	#Candidates
grep -w -f uniqAR.list arbacia_maped.out| grep 'intergenic'| grep -w -f candidates_paper.list|wc -l #1

#Exons and introns
	#Total
grep -w -f uniqAR.list arbacia_maped.out| grep 'exon'|wc -l #49
grep -w -f uniqAR.list arbacia_maped.out| grep 'intron'|wc -l #16
grep -w -f uniqAR.list arbacia_maped.out| grep 'exon'|grep 'intron'|wc -l #2
#16-2= 14 introns

	#Candidates
grep -w -f uniqAR.list arbacia_maped.out| grep 'exon'| grep -w -f candidates_paper.list|wc -l #1
grep -w -f uniqAR.list arbacia_maped.out| grep 'intron'| grep -w -f candidates_paper.list|wc -l #0

cd /piec1/mpascual/d.huerta/paracentrotus/maping/allids

#Paracentrotus lividus
#Mapped and not mapped
	#TOTAL
cut -f1 paracentrotus_maped.out| sort| uniq| wc -l #342
cut -f1 paracentrotus_maped.out |sort|uniq > mappedPA.list
grep -w -f /piec1/mpascual/d.huerta/paracentrotus/maping/allids/mappedPA.list paracentrotus_id.csv |wc -l #342
grep -w -v -f /piec1/mpascual/d.huerta/paracentrotus/maping/allids/mappedPA.list paracentrotus_id.csv |wc -l #3388
	#CANDIDATES
cut -f1 paracentrotus_maped.out| sort| uniq| grep -w -f /piec1/mpascual/d.huerta/paracentrotus/candidates.list |wc -l #mapped: 30
cut -f1 paracentrotus_maped.out| sort| uniq| grep -w -f /piec1/mpascual/d.huerta/paracentrotus/candidates.list > candidats_mapejats.list
grep -w -v -f candidats_mapejats.list /piec1/mpascual/d.huerta/paracentrotus/candidates.list| wc -l #no mapped: 372

#Uniq and repeated
cut -f1 paracentrotus_maped.out| sort|uniq -c|grep ' 1 '|sed 's/      1 //' >uniqPA.list
 #TOTAL
cut -f1 paracentrotus_maped.out| sort|uniq -c|grep ' 1 '|wc -l #242 uniq
cut -f1 paracentrotus_maped.out| sort|uniq -c|grep -v ' 1 '|wc -l #100 repeated
 #CANDIDATES
cut -f1 paracentrotus_maped.out| sort|uniq -c|grep ' 1 '| grep -w -f /piec1/mpascual/d.huerta/paracentrotus/candidates.list |wc -l #21 uniq
cut -f1 paracentrotus_maped.out| sort|uniq -c|grep -v ' 1 '| grep -w -f /piec1/mpascual/d.huerta/paracentrotus/candidates.list |wc -l #9 repeated 
#Genic and intergenic
 #TOTAL
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'gene'|wc -l #0
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'intergenic'|wc -l #43

 #CANDIDATES
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'intergenic'| grep -w -f /piec1/mpascual/d.huerta/paracentrotus/candidates.list |wc -l #4
#Exon and intron
 #TOTAL
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'exon'|wc -l #183
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'intron'|wc -l #23
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'exon'| grep 'intron'| wc -l #8
#introns= 23-8= 15 + 1 (porque es pseudogen)
grep -w -f uniqPA.list paracentrotus_maped.out| grep -w -v 'intergenic'|grep  -v 'exon\|intron' #searching the genes without annotation of exon or intron
#LOC115925975
grep '2503884' /piec1/mpascual/d.huerta/paracentrotus/candidates.list #para comprobar que el gen sin anotacion de exon e intron es un marcador candidato
gunzip -c GCF_000002235.5_Spur_5.0_genomic.gff.gz | grep 'LOC115925975'| grep 'pseudogene'
#NW_022145604.1	Gnomon	pseudogene	5455478	5458499	.	+	.	ID=gene-LOC115925975;Dbxref=GeneID:115925975;Name=LOC115925975;gbkey=Gene;gene=LOC115925975;gene_biotype=pseudogene;pseudo=true
#if the pseudogene doesn't have id-xxx it means it's an intron

 #CANDIDATES
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'exon'|grep -w -f /piec1/mpascual/d.huerta/paracentrotus/candidates.list |wc -l #14
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'intron'|grep -w -f /piec1/mpascual/d.huerta/paracentrotus/candidates.list |wc -l #3
grep -w -f uniqPA.list paracentrotus_maped.out |grep 'exon'|grep 'intron' |grep -w -f /piec1/mpascual/d.huerta/paracentrotus/candidates.list |wc -l #1
#introns= 3-1=2 + 1 (porque es pseudogen)

#Goterms
cd /piec1/mpascual/alopez
cut -f7,9 'GCA_000002235.4 Spur_5.0_annotations.txt'> geneID_protID_STv2.txt
cp geneID_protID_STv2.txt /piec1/mpascual/d.huerta/arbacia/goterms
cp geneID_protID_STv2.txt /piec1/mpascual/d.huerta/paracentrotus/goterms/
cd /piec1/mpascual/d.huerta/paracentrotus/maping/allids
grep -w -v 'intergenic' arbacia_maped.out |cut -f14| sed 's/\t/\n/g'|sort|uniq >mapped_genes_AR.list
cd /piec1/mpascual/d.huerta/paracentrotus/maping/allids
grep -w -v 'intergenic' paracentrotus_maped.out |cut -f14| sed 's/\t/\n/g'|sort|uniq > mapped_genes_PA.list


mv GCF_000002235.5_Spur_5.0_genomic.gff.gz /piec1/mpascual/d.huerta/paracentrotus/goterms
mv GCF_000002235.5_Spur_5.0_genomic.gff.gz /piec1/mpascual/d.huerta/paracentrotus/goterms
mv GCF_000002235.5_Spur_5.0_protein.faa.gz /piec1/mpascual/d.huerta/paracentrotus/goterms
mv geneID_protID_ST.txt /piec1/mpascual/d.huerta/paracentrotus/goterms
mv /piec1/mpascual/d.huerta/paracentrotus/maping/allids/mapped_genes_PA.list /piec1/mpascual/d.huerta/paracentrotus/goterms
python /piec1/c.pegueroles/python/3.5/longestProteinFromFasta.py /piec1/mpascual/d.huerta/paracentrotus/goterms/GCF_000002235.5_Spur_5.0_protein.faa.gz /piec1/mpascual/d.huerta/paracentrotus/goterms/mapped_genes_PA.list /piec1/mpascual/d.huerta/paracentrotus/goterms/geneID_protID_STv2.txt /piec1/mpascual/alopez/mappedGenes_longestProtPAv2.fa

python /piec1/c.pegueroles/python/3.5/longestProteinFromFasta.py /piec1/mpascual/d.huerta/arbacia/goterms/GCF_000002235.5_Spur_5.0_protein.faa.gz /piec1/mpascual/d.huerta/arbacia/goterms/mapped_genes_AR.list /piec1/mpascual/d.huerta/arbacia/goterms/geneID_protID_STv2.txt /piec1/mpascual/alopez/mappedGenes_longestProtARv2.fa

#log in at node 112
#source /home/usuaris/mpascual/biopython/bin/activate


#EGGNOG FILTROS: 
#Version eggmapper 2.1
python /piec1/c.pegueroles/python/3.5/eggNOG_gene2gov2.py  /piec1/mpascual/alopez/out.emapper.PA.annotations  /piec1/mpascual/alopez/st2goPA.txt
python /piec1/c.pegueroles/python/3.5/eggNOG_gene2gov2.py  /piec1/mpascual/alopez/out.emapper.AR.annotations /piec1/mpascual/alopez/st2goAR.txt 

cd /piec1/mpascual/d.huerta/arbacia/goterms/
sed 's/LOC/gene-LOC/' arbacia_maped.out | sed 's/TR/gene-TR/'|sed 's/wnt1/gene-wnt1/' |sed 's/NADK/gene-NADK/' |sed 's/SpP19L/gene-SpP19L/'|sed 's/PMCA/gene-PMCA/'|sed 's/IrxA/gene-IrxA/'|sed 's/gnaq/gene-gnaq/'| sed 's/SNAP-25/gene-SNAP-25/'| sed 's/SoxB2/gene-SoxB2/'| sed 's/COLP2alpha/gene-COLP2alpha/'| sed 's/dlp/gene-dlp/' |sed 's/arc2/gene-arc2/'|sed 's/GATAc/gene-GATAc/'|sed 's/FoxA/gene-FoxA/'>pruebadef.out
python /piec1/c.pegueroles/python/3.5/integrateeggNOG.py /piec1/mpascual/d.huerta/arbacia/goterms/pruebadef.out /piec1/mpascual/d.huerta/arbacia/goterms/geneID_protID_STv2.txt /piec1/mpascual/d.huerta/arbacia/goterms/st2goAR.txt /piec1/mpascual/d.huerta/arbacia/goterms/arbacia_gotermsDEF.out
cut -f1,4 arbacia_gotermsDEF.out > genes2goAR.out

cd /piec1/mpascual/d.huerta/paracentrotus/goterms/
sed 's/LOC/gene-LOC/' paracentrotus_maped.out |sed 's/gnaq/gene-gnaq/'|sed 's/4e-bp/gene-4e-bp/'|sed 's/COLP1alpha/gene-COLP1alpha/'|sed 's/hox1/gene-hox1/'|sed 's/gpc-6/gene-gpc-6/'|sed 's/tetrakcng/gene-tetrakcng/'|sed 's/SNAP-25/gene-SNAP-25/'|sed 's/NK2.2/gene-NK2.2/'|sed 's/Hbox7/gene-Hbox7/'|sed 's/Klf7/gene-Klf7/'>pruebadef.out
python /piec1/c.pegueroles/python/3.5/integrateeggNOG.py /piec1/mpascual/d.huerta/paracentrotus/goterms/pruebadef.out /piec1/mpascual/d.huerta/paracentrotus/goterms/geneID_protID_STv2.txt /piec1/mpascual/d.huerta/paracentrotus/goterms/st2goPA.txt /piec1/mpascual/d.huerta/paracentrotus/goterms/ParacentrotusGOterms.out
cut -f1,4 ParacentrotusGOterms.out >genes2goPA.out


cut -f2 genes2goAR.out |sort|uniq -c |cut -d' ' -f7|sort| uniq -c
cut -f2 genes2goAR.out |sort|uniq -c |cut -d' ' -f6|sort| uniq -c
cut -f2 genes2goAR.out |sort|uniq -c |cut -d' ' -f5|sort| uniq -c
awk '{if(/[0-9]+\sGO/) print $2}' genes2goAR.out |sort|uniq -c|grep -v ' 1 '|grep -v ' 2 '|sed 's/GO/\tGO/'|cut -f2 >awkgotermsAR.txt
cp awkgotermsAR.txt /piec1/mpascual/alopez/

cut -f2 genes2goPA.out |sort|uniq -c |cut -d' ' -f7|sort| uniq -c
cut -f2 genes2goPA.out |sort|uniq -c |cut -d' ' -f6|sort| uniq -c
cut -f2 genes2goPA.out |sort|uniq -c |cut -d' ' -f5|sort| uniq -c
awk '{if(/[0-9]+\sGO/) print $2}' genes2goPA.out |sort|uniq -c|grep -v ' 1 '|grep -v ' 2 '|sed 's/GO/\tGO/'|cut -f2 >awkgotermsPAv2.txt
cp awkgotermsPAv2.txt /piec1/mpascual/alopez/
