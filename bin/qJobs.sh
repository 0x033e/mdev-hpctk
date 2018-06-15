#!/bin/bash

usage(){
 echo "Script to run all Grid Engine Submission Scrips *.sge.sh with a directory"
 echo
 echo "Usage qJobs.sh"
 echo "Optional Options :"
 echo " -h  Print this help"
 echo " --pass pass through options from command line or file : DO NOT INCLUDE INPUT / OUTPUT"
 echo "        Usage : --pass '-flag setting -flag2 setting2 etc'"
 echo ""
 exit 1
}

OPTIONS=$(getopt -o h --long pass: -- "$@")
[ $? -eq 0 ] || { 
	echo "Incorrect options provided"; usage 
} 
eval set -- "$OPTIONS" 
while true; do 
	case "$1" in 
        -h) usage ;; 
        --pass) shift ; PASS=$1 ;;    
        --) shift ; break ;;
        *) echo "Unexpected option $1" ; usage ;; 
        esac 
        shift 
done

echo "Passthrough Options="$PASS

shopt -s nullglob
for DAT in *.sge.sh; do

 echo 'Running '$DAT
 qsub $PASS $DAT
 sleep 1

done

