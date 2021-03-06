#!/bin/bash


export HPCTK_HOME=/mnt/opt/hpctk
export HPCTK_BIN=$HPCTK_HOME/bin
export HPCTK_SCRIPTS=$HPCTK_HOME/scripts
export HPCTK_MODULES=$HPCTK_HOME/modules
export TK_BASE="/mnt/gpfs/backup"

#echo $HPCTK_BIN
if [ -e $HPCTK_BIN ]; then
 export PATH=$PATH:$HPCTK_BIN
fi

#ADD HPCTK_MODULES TO MODULEPATH
if [[ ! $MODULEPATH == *"hpctk"* ]]; then
 export MODULEPATH=$MODULEPATH:$HPCTK_MODULES
fi

export APPS_SHARED=/mnt/opt/Centos7
export APPS_MODULES=$APPS_SHARED/modules

#ADD MODULES TO MODULEPATH
#if [[ ! $MODULEPATH == *"mnt/opt"* ]]; then
 for dir in $APPS_MODULES/* ; do
    ##echo "DIR=$dir"
    export MODULEPATH=$MODULEPATH:$dir
 done
#fi



#REMOVE DUPLICATES FROM MODULE PATH
MODULEPATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{MODULEPATH}))')"

#REMOVE DUPLICATES FROM PATH
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

alias vi=vim
shopt -s direxpand

#--- END MODULE SECTIONS ---

#ENABLE DEVTOOLS 7 IF AVAILABLE
if [ -e /opt/rh/devtoolset-7/enable ]
then
 :
 source /opt/rh/devtoolset-7/enable
 alias sudo=/usr/bin/sudo
fi

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


