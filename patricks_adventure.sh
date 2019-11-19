#!/bin/bash

# an adventure for man who is looking for his path of life

# corresponding variable arguments that must be inputted before script is to be run 
name=$1 
age=$2
# number of x arguments to execute by script
num_args=$#

if [[ ${num_args} -eq 2 ]]; then # number of arguments needed to initiate rest of script. This case, 2 
	echo "Welcome ${name}!! I see you are ${age} years old. Which means you are legally able to try this program!!!"

else # if number of arguments doe not equal 2, echo prompt to give two arguments. Ends script 
	echo "You are required to enter 2 arguments before you initiate $0: <name>, <age>."
    exit 1
fi 


echo "Now the next test, you must choose the path that will lead you to your destiny"

# defined function to initiate choices made by user
function path_of_destiny() {

	echo "Do you wish to take the left path of the right path?"
	read chosen_path

	right_path=left
    
    # prompt when user chosses the right path
	if [[ ${chosen_path} != ${right_path} ]]; then
		echo "You took the rigth path! But that does not mean you took the right path."
		echo "You have a another chance if life. Enter a number between 1 - 99" 
		# script allows user to give an input number ranges 1 to 99
        read last_num
        # if number is not equal to 50, script will exit 
        if [[ ${last_num} -ne 50 ]]; then
        	for i in ${last_num}; do
        		echo ${i}
        	done
        	echo "Die"
        	exit 1
        else
        	echo "You saved your life, for now. No go home!!!" 
        fi
    # if user inputs the correct number 
    else
    	echo "You have taken the left path. Add a grain of salt on your shoulder and your one ticket to hell!!"   	
    fi
}		

# function that executes the defined function
path_of_destiny
exit 1
