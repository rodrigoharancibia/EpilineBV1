# !/bin/bash


#this script automates the download of proteomes sequences from NCBI 
# Written by: Rodrigo Alex Henríquez Arancibia and Gustavo Pires 
# Date Written: May  24,2024
# Last Modified by Alex Arancibia : July 29,2024 

#read -p "To insert specie name:" Specie   


data_hoje=$(date +"%d-%m-%Y") # Defining the date


mkdir "Sequences_$data_hoje" 

cd "Sequences_$data_hoje" 

# Download assembly summary file 
rsync -t -v rsync://ftp.ncbi.nih.gov/genomes/refseq/bacteria/assembly_summary.txt ./ 

# Extract relevant columns from summary file
grep -iE 'Prescottella equi.*' assembly_summary.txt | cut -f 1,8,9,12,16,20 >file

# Selecting Ftp of Complete Genome
awk -F "\t" '{if($8 ~  /^Prescottella equi/ && $12=="Complete Genome") print $20}' assembly_summary.txt > ftpdirpaths

awk 'BEGIN{FS=OFS="/";filesuffix="protein.faa.gz"}{ftpdir=$0;asm=$10;file=asm"_"filesuffix;print ftpdir,file}' ftpdirpaths > ftpfiles


wget  -i  ftpfiles


gunzip *.faa.gz

cp  *.faa   cd ../



