#!/bin/bash

#cd /nas-hs/users/katharina/krumlov # modify to your own path, by default downloading to current directory
mkdir busco
cd busco
# for Arabidopsis thaliana, example in braker & galba
wget https://busco-data.ezlab.org/v4/data/lineages/brassicales_odb10.2020-08-05.tar.gz
tar -zxvf brassicales_odb10.2020-08-05.tar.gz
rm brassicales_odb10.2020-08-05.tar.gz
# for the application task, Babesia duncani
wget https://busco-data.ezlab.org/v4/data/lineages/alveolata_odb10.2020-09-10.tar.gz
tar -zxvf alveolata_odb10.2020-09-10.tar.gz
rm alveolata_odb10.2020-09-10.tar.gz
cd ..
mkdir orthodb
cd orthodb
# for Arabidopsis thaliana, example in braker & galba
wget https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/Viridiplantae.fa.gz
gunzip Viridiplantae.fa.gz
# for the application task, Babesia duncani
wget https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/Alveolata.fa.gz
gunzip Alveolata.fa.gz
cd ..
mkdir sra
cd sra
# Arabidopsis thaliana, only if anyone wants to try running Hisat themselves, probably not happening due to runtime
# wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_1.fastq.gz
# wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_2.fastq.gz
# output of Hisat2 for above named libraries, could potentially be skipped but is mentioned in notebook
#wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/SRR934391.sam # only needed if anyone wants to sort on site... not needed to execute the regular notebook
# Babsia duncani, selected only those reads that mapped with hisat2
wget http://bioinf.uni-greifswald.de/webaugustus/examples/krumlov/SRR18907291.s.mapped.bam
# genome of 
cd ..
mkdir genome
cd genome
# Chr 4 of Babsia duncani
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/genome.fa.gz
gunzip genome.fa.gz
cd ..
mkdir proteins
cd proteins
# proteins of all other Babesia species from NCBI genomes
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/proteins.fa.gz
gunzip proteins.fa.gz
# 4.5 GB of data in total, if the sam file is not downloaded. The sam file for Arabidospis is another 10 GB if you want to download it to play with samtools.