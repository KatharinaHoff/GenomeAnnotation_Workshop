# 2023 Workshop on Genomics, Cesky Krumlov: Genome Annotation

This repository contains course materials for a workshop on structural genome annotation with BRAKER, GALBA, and TSEBRA. The course is part of the 2023 Workshop on Genomics in Cesky Krumlov, Czech Republic (https://evomics.org/2023-workshop-on-genomics-cesky-krumlov/).

Authors: Katharina Hoff & Natalia Nenasheva

Contact: katharina.hoff@uni-greifswald.de

## Cloning this repository

Open a terminal window and enter (press enter key after typing):

```
git clone https://github.com/KatharinaHoff/GenomeAnnotation_Workshop2023.git
```

This will create a folder called `GenomeAnnotation_Workshop2023` in your home directory. This folder contains the JupyterNotebook for this course (GenomeAnnotation.ipynb).

## Obtaining the Singularity Image File

The organizers of the Cesky Krumlov Workshop on Genomics have already compiled a file called `genome_annotation.sif` for you. You find this file at `/home/genomics/workshop_materials/genome_annotation`. However, if you want to obtain the same image for using it after the course, you can do so as follows (with singularity-ce version 3.11.2, available from https://github.com/sylabs/singularity, find their installation instructions at https://github.com/sylabs/singularity/blob/main/INSTALL.md, make sure you are not using an older version of singularity, as this may cause problems):

```
singularity build genome_annotation.sif docker://katharinahoff/ceskykrumlov23-notebook:latest
```

## Displaying the JupyterNotebook on Genome Annotation with this Singularity Image

You can run the image for JupyterNotebook display in any bash terminal from your home directory as follows:

```
# execute from your user home directory, should not be a group drive
singularity exec --cleanenv --bind /home/genomics/workshop_materials/genome_annotation:/home/genomics/workshop_materials/genome_annotation --bind ${PWD}:${PWD} --bind $PWD:/home/jovyan /home/genomics/workshop_materials/genome_annotation/genome_annotation.sif jupyter notebook --no-browser --ip=127.0.0.1
```

The local directory `/home/genomics/workshop_materials` may only be available during the course on site at Cesky Krumlov's AWS instance. If you want to use the image after the course, you may want to remove this directory from the command above (explicitely, remove: `--bind /home/genomics/workshop_materials/genome_annotation:/home/genomics/workshop_materials/genome_annotation`). Also, you of course need to specify the true location of the image, modify the command if it does not reside at `/home/genomics/workshop_materials/genome_annotation/genome_annotation.sif`.

It is vital that you mount `/home/jovyan` to a writable location. Otherwise, you will not be able to save your work. The command above will mount the current working directory to `/home/jovyan`. If you want to mount a different directory, replace `${PWD}` with the path to the directory you want to mount (this corresponds specifically to this part of the command: `--bind ${PWD}:/home/jovyan`).

The flag `--cleanenv` makes sure that other environment variables/tools (e.g. Perl dependencies) installed on the host do not interfere with the image.

This will display a link in your terminal that you may post into your web browser. The link will look something like this:

```
http://127.0.0.1:8888/?token=4aff4819888e4afd61a63b3015f8a1f816deea84efe2cd3f
```

:bomb: The Docker container that is the foundation of this Singularity image file contains a license key for GeneMark-ETP that has an (unknown) expiration date (probably expiring less than a year from now). By using BRAKER1, BRAKER2, or BRAKER3 with any version of GeneMark-ES/ET/EP/ETP/S-T, you agree to the license terms of GeneMark-ES/ET/EP/ETP/S-T (terms available at http://exon.gatech.edu/GeneMark/license_download.cgi). If you want to use BRAKER1, BRAKER2, or BRAKER3 after the expiration date of the license key, we recommend that you use the official BRAKER container available from https://hub.docker.com/r/teambraker/braker3. That container will likely be updated with new license keys, in the future.


## Course contents

   * theory: repeat library generation and repeat masking with RepeatModeler2/RepeatMasker
   * theory: short read RNA-Seq to genome alignment with Hisat2
   * theory: sorting an RNA-Seq alignment file with Samtools
   * practice: application of BRAKER3 (structural genome annotation with RNA-Seq alignments and a large protein data base)
   * practice: application of BRAKER1 (structural genome annotation with short read RNA-Seq alignments)
   * practice: application of BRAKER2 (structural genome annotation with protein database)
   * practice: application of GALBA (structural genome annotation with proteins of a closely related species, suitable for e.g. vertebrate genomes)
   * practice: merging BRAKER1 and BRAKER2 (or GALBA) gene sets with TSEBRA
   * practice: BUSCO assessment of predicted gene set
   * practice: preparing an assembly hub for the UCSC Genome Browser with MakeHub 
   * for advanced learners: annotate a chromsome of *Basesia duncati*

## Data sets

If you want to execute the JupyterNotebooks, you will need data. At the Cesky Krumlov Workshop, these datasets have already been prepared for you at /home/genomics/workshop_materials/genome_annotation. If you want to use the JupyterNotebook after the course, you will need to download the data sets to your local device. Simply execute [obtain_data.sh](obtain_data.sh) in your terminal (e.g. `bash obtain_data.sh`). This will require **59 GB** of free space!

## Moving from JupyterLab to SLURM

The exact same container that is used for rendering our teaching materials with JupyterLab can be used on any HPC (that has singularity support) with a SLURM scheduler. In this case, you will not execute JupyterLab, but submit a task with SLURM for computation. Example for calling BRAKER3 with SLURM:

### Script contents: braker3.sh

```
#!/bin/bash                                  
#SBATCH -o braker.%j.%N.out
#SBATCH -e braker.%j.%N.err
#SBATCH --get-user-env
#SBATCH --time=72:00:00
#SBATCH -N 1 # number of nodes, BRAKER does not scale across multiple nodes
#SBATCH -n 48 # number of threads on that node, BRAKER does not scale well to hundreds of threads, we often execute on 8-48 threads

module load singularity

(singularity exec -B $PWD:$PWD genome_annotation.sif braker.pl --genome=genome.fasta.masked --prot_seq=proteins.fa --bam=rnaseq.bam --threads 48 ) &> braker3.log
```

Any tasks from our JupyterNotebook cells can be implemented in such scripts.

### Submit the script

Simply submit the job with sbatch:

```
sbatch braker3.sh
```

## Acknowledgements

Stefan Kemnitz from The University Compute Center at University of Greifswald (https://rz.uni-greifswald.de/dienste/allgemein/sonstiges/high-performance-computing/) kindly assisted in building docker containers for genome annotation with methods developed at University of Greifswald.
