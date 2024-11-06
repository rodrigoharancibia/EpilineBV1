# !/bin/bash


#this script automates the process of running orthofinder and genetares Core proteome 


# Written by: Rodrigo Alex Henríquez Arancibia  
# Date Written: February ,2024



 mv *.faa OrthoFinder/ 

 OrthoFinder_path=$(find  -name OrthoFinder) # Collecting The Path of orthogroup folder


cp -n pangenome.pl  OrthoFinder
 
cp -n list.pl OrthoFinder




 cd OrthoFinder/
 
data_hoje=$(date +"%d-%m-%Y") # Defining the date


mkdir "Sequences-$data_hoje"

mv *.faa "Sequences-$data_hoje"
 
./orthofinder -f  Sequences-$data_hoje -og




 Orthogroups_path=$(find  -name Orthogroups) # Collecting The Path of orthogroup folder



Pangenome_path=$(realpath pangenome.pl)
cp -n $Pangenome_path $Orthogroups_path # Coping the pangenome.pl and list.pl to the orthogroup folder


List_path=$(realpath list.pl)
cp -n  $List_path $Orthogroups_path





Sequences_path=$(find   -name  "Sequences-$data_hoje")
cd $Sequences_path
cat *.faa > all_proteins.faa


Orthogroups_path2=$(find  -name Orthogroups) # Collecting The Path of orthogroup folder again to move files to avoid incompability 
mv all_proteins.faa $Orthogroups_path2



cd $Orthogroups_path2


./pangenome.pl Orthogroups.tsv Orthogroups_UnassignedGenes.tsv
cp core.txt core.list
perl -pi -e "s/\,.+\n/\n/g" core.list
perl -pi -e "s/\t.+\n/\n/g" core.list


./list.pl core.list all_proteins.faa > core.faa 


