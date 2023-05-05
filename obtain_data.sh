#!/bin/bash

cd /nas-hs/users/katharina/krumlov # modify to your own path!
mkdir busco
cd busco
wget https://busco-data.ezlab.org/v4/data/lineages/brassicales_odb10.2020-08-05.tar.gz
tar -zxvf brassicales_odb10.2020-08-05.tar.gz
rm brassicales_odb10.2020-08-05.tar.gz
wget https://busco-data.ezlab.org/v4/data/lineages/alveolata_odb10.2020-09-10.tar.gz
tar -zxvf alveolata_odb10.2020-09-10.tar.gz
rm alveolata_odb10.2020-09-10.tar.gz
cd ..
mkdir orthodb
cd orthodb
wget https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/Viridiplantae.fa.gz
gunzip Viridiplantae.fa.gz
wget https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/Alveolata.fa.gz
gunzip Alveolata.fa.gz
cd ..
mkdir sra
cd sra
# Arabidopsis thaliana, only if anyone wants to try running Hisat themselves, probably not happening due to runtime
# wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_1.fastq.gz
# wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_2.fastq.gz
# output of Hisat2 for above named libraries, could potentially be skipped but is mentioned in notebook
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/SRR934391.sam


#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR196/044/SRR19666444/SRR19666444_1.fastq.gz
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR196/044/SRR19666444/SRR19666444_2.fastq.gz
# generated sam file with hisat2, then ran samtools...
# genome of 
cd ..
mkdir genome
cd genome
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/genome.fa.gz
gunzi genome.fa.gz
cd ..
mkdir proteins
cd proteins
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/proteins.fa.gz
gunzip proteins.fa.gz
# 31 GB of data in total