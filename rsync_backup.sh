#!/bin/bash

# program that rsyncs all non-hidden files into a example backup dir/. User can specify which directory path source to execute program
# if no argument is specified, it will automatically update the server backup directory every day at 10:00

dir_name=${1}

num_args=$#

echo ${dir_name}

if [[ -d ${dir_name} ]]; then 

	if [[ ${num_args} -eq 1 ]]; then

    	echo "copying ${dir_name} on example backup dir..."
	
    	rsync -avh --include="*.txt" --exclude=".*" --include="*/" ${dir_name} patzap@192.168.2.55:~/Mint_DIR # exclude all(*) files that are hidden

    	ssh patzap@192.168.2.55
	
    	echo "end of backup"

	fi

else    

	#default backups that will be executed automatically 
	echo "No argument was given, will proceed to automatic backup..."
	
	date >> rsync_log.txt
	
	#Stores backup data on a txt file
	rsync -avh --exclude=".*" ~/Backup patzap@192.168.2.55 >> rsync_log.txt 
	
	rsync -avh ~/Desktop/Notes pz@192.168.56.10:~/Mint_DIR >> rsync_log.txt
	
	echo "End of backup :)"
	
fi
