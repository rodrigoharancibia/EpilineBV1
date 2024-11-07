

wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.16.0+-x64-linux.tar.gz
tar -xvf ncbi-blast-2.16.0+-x64-linux.tar.gz


chmod +x pangenome.pl
chmod +x list.pl


chmod +x download_orthorfinder.sh
./download_orthorfinder.sh 

chmod +x download_sequences.sh
./download_sequences.sh


chmod +x  run_orthofinder.sh
./run_orthofinder.sh 
