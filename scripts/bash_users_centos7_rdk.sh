#!/bin/bash

#module () {
#    eval `/usr/bin/modulecmd bash $*`
#}

#--- LOAD MODULES ---

export APPS_SHARED=/mnt/opt/Centos7
export APPS_MODULES=$APPS_SHARED/modules

for dir in $APPS_MODULES/* ; do
    export MODULEPATH=$MODULEPATH:$dir
done

#REMOVE DUPLICATES FROM MODULE PATH
MODULEPATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{MODULEPATH}))')"

#REMOVE DUPLICATES FROM PATH
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

#OTHERS 

#alias ssh="ssh -X"
alias vi=vim
shopt -s direxpand

#--- END MODULE SECTIONS ---

#ENABLE DEVTOOLS 7 IF AVAILABLE
if [ -e /opt/rh/devtoolset-7/enable ]
then
 :
 if [[ $EUID -ne 0 ]]; then
   source /opt/rh/devtoolset-7/enable
   alias sudo=/usr/bin/sudo
 else
   if [[ $- =~ "i" ]]; then :
     #echo "INTERACTIVE ROOT SESSION"
     source /opt/rh/devtoolset-7/enable
     alias sudo=/usr/bin/sudo
   fi
 fi
fi


#Enable nodejs8 
if [ -e /opt/rh/rh-nodejs8/enable ]
then
 :
 source /opt/rh/rh-nodejs8/enable
 alias sudo=/usr/bin/sudo
fi


#ENABLE LATEST VERSION OF GIT IF AVAILABLE
if [ -e /opt/rh/rh-git29/enable ]
then
 :
 source /opt/rh/rh-git29/enable
fi



module load proj/6.2.0
