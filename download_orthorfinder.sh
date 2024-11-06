# !/bin/bash  

#this script automates the download and tests the installation
#Written by: Rodrigo Alex Henríquez Arancibia 
# Date Written: October,2023


#!/bin/bash  
#Download orthofinder
from os import chmod


wget https://github.com/davidemms/OrthoFinder/releases/latest/download/OrthoFinder.tar.gz # to download the latest version of Orthofinder 
tar -xzf OrthoFinder.tar.gz 
cd OrthoFinder/

# testing orthofinder 
chmod +x orthofinder # permitindo permissão de execução
./orthofinder -h  # help command


cd .. 




