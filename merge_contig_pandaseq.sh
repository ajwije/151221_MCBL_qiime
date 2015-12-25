#!/bin/bash
echo "Enter the maximum length of the assembled reads, e.g. V4 should be 251 and press ENTER:"
read max_length


echo "Enter the first primer and press ENTER::"

read first_primer 

echo "Enter second primer and press ENTER:"

read second primer 



echo "Enter the path to the directory where your files are located and press ENTER:" 
read project_directory_path


echo "Enter the path to the directory where your results should be written and press ENTER:" 
read result_directory_path

PROJECT_DIR=$project_directory_path

cd $PROJECT_DIR

PANDA_MERGED=$result_directory_path/pandaseq_merged
mkdir $PANDA_MERGED
sample_name=*_S

module load Pandaseq/2.8


for i in {1..59}

do {

FIRST_SAMPLE=${sample_name}${i}_L001_R1_001.fastq.gz


SECCOND_SAMPLE=${sample_name}${i}_L001_R2_001.fastq.gz


echo "Now processing:" $FIRST_SAMPLE $SECCOND_SAMPLE


pandaseq -a -f $FIRST_SAMPLE -r $SECCOND_SAMPLE -w $PANDA_MERGED/S${i}.fasta -g $PANDA_MERGED/S${i}.log -L $max_length -t 0.7
} done

module unload Pandaseq/2.8
