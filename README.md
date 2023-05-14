# 2023 Workshop on Genomics, Cesky Krumlov: Genome Annotation

This repository contains course materials for a workshop on structural genome annotation with BRAKER, GALBA, and TSEBRA. The course is part of the 2023 Workshop on Genomics in Cesky Krumlov, Czech Republic (https://evomics.org/2023-workshop-on-genomics-cesky-krumlov/).

Authors: Katharina Hoff & Natalia Nenasheva

Contact: katharina.hoff@uni-greifswald.de

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


## Cloning the GiHub repository for this workshop

Open Guacamole Desktop and open a terminal from within the Desktop environment.

<img width="949" alt="Screenshot 2023-05-14 at 12 27 02" src="https://github.com/KatharinaHoff/GenomeAnnotation_Workshop2023/assets/38511308/c7048382-cee7-4f4d-888d-fc79498ebca9">

In your terminal, in your home (~), make a new directory for the git clone

```
mkdir your_name_GA
cd your_name_GA
git clone https://github.com/KatharinaHoff/GenomeAnnotation_Workshop2023.git
```

### Remember:
To copy/paste in Guacamole Desktop you have to do:
Ctl + Shift + Command to open the dialog box on the left of the screen. To close the dialog box do Ctl + Shift + Command. To paste you write click in the terminal. 

This will create a folder called `GenomeAnnotation_Workshop2023` in your home directory. This folder contains the JupyterNotebook for this course (GenomeAnnotation.ipynb) and all the necessary data ☺️

The organizers of the Cesky Krumlov Workshop on Genomics have already compiled a singularity file called `genome_annotation.sif` for you. You can find this file at `/home/genomics/workshop_materials/genome_annotation`.

With the cloned data and the singularity file (`genome_annotation.sif`), you can run the image for JupyterNotebook display in the terminal as follows:

cd into the `your_name_GA` directory

```
singularity exec --cleanenv --bind /home/genomics/workshop_materials/genome_annotation:/home/genomics/workshop_materials/genome_annotation --bind ${PWD}:${PWD} --bind $PWD:/home/jovyan /home/genomics/workshop_materials/genome_annotation/genome_annotation.sif jupyter notebook --no-browser --ip=127.0.0.1
```

This will display 3 links in your terminal. The links will look something like this:
```
http://127.0.0.1:8888/?token=4aff4819888e4afd61a63b3015f8a1f816deea84efe2cd3f
```

Open one of the links by right-clicking on it and say "open link". This will open a firefox web browser window. You should see something like the following:

<img width="1050" alt="Screenshot 2023-05-14 at 12 25 07" src="https://github.com/KatharinaHoff/GenomeAnnotation_Workshop2023/assets/38511308/21e3f2f8-d532-4115-8a59-8527fe2d32cc">

DO NOT CLOSE YOUR TERMINAL! 🖥 It's essential that you keep it open. Click on the folder to access the workshop content. Double click to open the GenomeAnnotation.ipynb. Welcome to the starting point of this lab 🤓


### A few notes about running code in Jupyter Notebooks:

You can run code by clicking "Run" at the top of the screen

<img width="650" alt="Screenshot 2023-05-14 at 12 33 24" src="https://github.com/KatharinaHoff/GenomeAnnotation_Workshop2023/assets/38511308/d9374ebe-a77d-493d-95b5-d5ad1668e992">

Alternatively, you can click inside any box which starts with

```
%%script bash
```

and type Shift + Enter

You can stop a code block running by pressing "Stop" (the black square)

<img width="567" alt="Screenshot 2023-05-14 at 12 44 32" src="https://github.com/KatharinaHoff/GenomeAnnotation_Workshop2023/assets/38511308/45e6d335-1476-408c-8ca5-ecf6a7456ba3">



When a code block (the kernel) is running, it will look like this:

```
In [*]
```

When a code block has finished running:

```
In [num]
```

where num is an index of the job

When a code block has not yet been run:

```
In[ ]
```

To create a new code block, you click on "Insert"


## If you want to run this course after the Workshop on Genomics 2023
## Obtaining the Singularity Image File

If you want to obtain the same image for using it after the course, you can do so as follows (with singularity-ce version 3.11.2, available from https://github.com/sylabs/singularity, find their installation instructions at https://github.com/sylabs/singularity/blob/main/INSTALL.md, make sure you are not using an older version of singularity, as this may cause problems):

```
singularity build genome_annotation.sif docker://katharinahoff/ceskykrumlov23-notebook:latest
```

## Opening the JupyterNotebook on Genome Annotation with this Singularity Image

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

