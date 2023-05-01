# 2023 Workshop on Genomics, Cesky Krumlov: Genome Annotation

This repository contains course materials for a workshop on structural genome annotation with BRAKER, GALBA, and TSEBRA. The course is part of the 2023 Workshop on Genomics in Cesky Krumlov, Czech Republic (https://evomics.org/2023-workshop-on-genomics-cesky-krumlov/).

Authors: Katharina Hoff & Natalia Nenasheva

Contact: katharina.hoff@uni-greifswald.de

## Cloning this repository

Open a terminal window (black symbol with white dollar-underscore sign) and enter (press enter key after typing):

```
git clone https://github.com/KatharinaHoff/GenomeAnnotation_Workshop2023.git
```

This will create a folder called `GenomeAnnotation_Workshop2023` in your home directory. This folder contains the JupyterNotebook for this course (GenomeAnnotation.ipynb).

## Obtaining the Singularity Image File

The organizers of the Cesky Krumlov Workshop on Genomics have already compiled a file called `genome_annotation.sif` for you. You find this file at /home/genomics/workshop_materials/genome_annotation. However, if you want to obtain the same image for using it after the course, you can do so as follows (with singularity-ce version 3.11.2, available from https://github.com/sylabs/singularity, find their installation instructions at https://github.com/sylabs/singularity/blob/main/INSTALL.md, make sure you are not using an older version of singularity, as this may cause problems):

```
singularity build genome_annotation.sif docker://katharinahoff/ceskykrumlov23-notebook:devel
```

## Displaying the JupyterNotebook on Genome Annotation with this Singularity Image

You can run the image for JupyterNotebook display in any bash terminal from your home directory as follows:

```
singularity exec --cleanenv --bind /home/genomics/workshop_material:/home/genomics/workshop_material --bind ${PWD}:${PWD} --bind $PWD:/home/jovyan ${HOME}/genome_annotation.sif jupyter notebook --no-browser --ip=127.0.0.1
```

The local directory /home/genomics/workshop_material may only be available during the course on site at Cesky Krumlov's AWS instance. If you want to use the image after the course, you may want to remove this directory from the command above (explicitely, remove: `--bind /home/genomics/workshop_material:/home/genomics/workshop_material`).

It is vital that you mount /home/jovyan to a writable location. Otherwise, you will not be able to save your work. The command above will mount the current working directory to /home/jovyan. If you want to mount a different directory, replace ${PWD} with the path to the directory you want to mount (this corresponds specifically to this part of the command: `--bind ${PWD}:/home/jovyan`).

The flag `--cleanenv` makes sure that other environment variables/tools (e.g. Perl dependencies) installed on the host do not interfere with the image.

This will display a link in your terminal that you may post into your web browser. The link will look something like this:

```
http://127.0.0.1:8888/?token=4aff4819888e4afd61a63b3015f8a1f816deea84efe2cd3f
```

:bomb: The Docker container that is the foundation of this Singularity image file contains a license key for GeneMark-ETP that has an expiration date. By using BRAKER1, BRAKER2, or BRAKER3 with any version of GeneMark-ES/ET/EP/ETP/S-T, you agree to the license terms of GeneMark-ES/ET/EP/ETP/S-T (terms available at http://exon.gatech.edu/GeneMark/license_download.cgi). If you want to use BRAKER1, BRAKER2, or BRAKER3 after the expiration date of the license key, we recommend that you use the official BRAKER container available from https://hub.docker.com/r/teambraker/braker3. That container will likely be updated with new license keys, in the future.


## Course contents

   * repeat library generation and repeat masking with RepeatModeler2/RepeatMasker
   * short read RNA-Seq to genome alignment with Hisat2
   * sorting an RNA-Seq alignment file with Samtools
   * application of BRAKER3 (structural genome annotation with RNA-Seq alignments and a large protein data base)
   * application of BRAKER1 (structural genome annotation with short read RNA-Seq alignments)
   * application of BRAKER2 (structural genome annotation with protein database)
   * application of GALBA (structural genome annotation with proteins of a closely related species, suitable for e.g. vertebrate genomes)
   * merging BRAKER1 and BRAKER2 (or GALBA) gene sets with TSEBRA
   * BUSCO assessment of predicted gene set
   * preparing an assembly hub for the UCSC Genome Browser with MakeHub 

## Data sets

If you want to execute the JupyterNotebooks, you will need data. At the Cesky Krumlov Workshop, these datasets have already been prepared for you at /home/genomics/workshop_materials/genome_annotation. If you want to use the JupyterNotebook after the course, you will need to download the data sets from the following locations:

   * ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_1.fastq.gz
   * ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR934/SRR934391/SRR934391_2.fastq.gz
   * https://nextcloud.uni-greifswald.de/index.php/s/kb7eswzzTe6KiNi # (SRR934391.sam, an intermediary results file that takes a long time to compute)
   * https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/Viridiplantae.fa.gz # you need to unpack this file with gunzip Viridiplantae.fa.gz


## Acknowledgements

Stefan Kemnitz from The University Compute Center at University of Greifswald (https://rz.uni-greifswald.de/dienste/allgemein/sonstiges/high-performance-computing/) kindly assisted in building docker containers for genome annotation with methods developed at University of Greifswald.
