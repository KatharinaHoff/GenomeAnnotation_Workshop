#!/bin/bash

cd /nas-hs/users/katharina/krumlov # modify to your own path!
mkdir busco
cd busco
wget https://busco-data.ezlab.org/v4/data/lineages/brassicales_odb10.2020-08-05.tar.gz
tar -zxvf brassicales_odb10.2020-08-05.tar.gz
rm brassicales_odb10.2020-08-05.tar.gz
wget https://busco-data.ezlab.org/v4/data/lineages/metazoa_odb10.2020-09-10.tar.gz
tar -zxvf metazoa_odb10.2020-09-10.tar.gz
rm metazoa_odb10.2020-09-10.tar.gz
cd ..
mkdir orthodb
cd orthodb
wget https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/Viridiplantae.fa.gz
gunzip Viridiplantae.fa.gz
wget https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/Metazoa.fa.gz
gunzip Metazoa.fa.gz
cd ..
mkdir sra
cd sra
# Arabidopsis thaliana, only if anyone wants to try running Hisat themselves, probably not happening due to runtime
# wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_1.fastq.gz
# wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_2.fastq.gz
# output of Hisat2 for above named libraries, could potentially be skipped but is mentioned in notebook
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/SRR934391.sam
# Hymenolopis microstoma
# VARUS output
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/Merged.bam
# genome of Hymenolopis microstoma repeat masked by NCBI
cd ..
mkdir genome
cd genome
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/469/805/GCA_000469805.3_HMN_v3/GCA_000469805.3_HMN_v3_genomic.fna.gz
gunzip GCA_000469805.3_HMN_v3_genomic.fna.gz
cd ..
mkdir proteins
cd proteins
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/proteins.fa.gz
gunzip proteins.fa.gz
# 59 GB of data in total