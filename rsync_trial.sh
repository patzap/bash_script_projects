#!/bin/bash

#testing script with rsync and ssh it to remote server 

#touch ~/example_file.txt
#mkdir ~/example_backup

dir=~/Desktop/random_txt/
txt_backup=0

#condition tests if dir is in fact a directory
if [ -d ${dir} -eq  ]; then
	txt_backup=$(ls ${dir} | awk '/.txt/ { print }') #after condition, parse all txt files in random_txt
	cat ${txt_backup} #make sure variable is working
	echo "${dir} contains txt files"
else
	echo "You are required to select a directory path before starting this program"
fi 

#ssh on the remote server and backups all txt files within the txt_backup variable. stores it on server dir called backup_txt
rsync -av --dry-run ssh ${dir} pz@192.168.56.10:~/backup_txt/

echo "End of backup :)"