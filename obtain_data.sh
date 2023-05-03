cd /nas-hs/users/katharina/krumlov # modify to your own path!
mkdir busco
cd busco
wget https://busco-data.ezlab.org/v4/data/lineages/brassicales_odb10.2020-08-05.tar.gz
tar -zxvf brassicales_odb10.2020-08-05.tar.gz
rm brassicales_odb10.2020-08-05.tar.gz
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
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_2.fastq.gz
# output of Hisat2 for above named libraries
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/SRR934391.sam
# Hymenolopis microstoma, only if anyone wants to try running Hisat themselves, probably not happening due to runtime
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR337/ERR337976/ERR337976_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR337/ERR337976/ERR337976_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR225/ERR225716/ERR225716_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR225/ERR225716/ERR225716_2.fastq.gz
# ouput of Hisat2, and Samtools bam conversion, and 2 rounds of samtools sort for above named libraries
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/ERR225716.ss.bam
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/ERR337976.ss.bam
# genome of Hymenolopis microstoma repeat masked (custom masking)
cd ..
mkdir genome
cd genome
wget https://bioinf.uni-greifswald.de/bioinf/katharina/krumlov/genome.fa.masked.gz
gunzip genome.fa.masked.gz

# 59 GB of data in total