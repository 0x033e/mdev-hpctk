#!/bin/bash

#module () {
#    eval `/usr/bin/modulecmd bash $*`
#}

export HPCTK_HOME=/tools_shared/hpctk
export HPCTK_BIN=$HPCTK_HOME/bin
export HPCTK_SCRIPTS=$HPCTK_HOME/scripts
export HPCTK_MODULES=$HPCTK_HOME/modules

#echo $HPCTK_BIN
export PATH=$PATH:$HPCTK_BIN
#echo $PATH

#ADD HPCTK_MODULES TO MODULEPATH
if [[ ! $MODULEPATH == *"hpctk"* ]]; then
 export MODULEPATH=$MODULEPATH:$HPCTK_MODULES
fi

export APPS_SHARED=/mnt/opt/Centos7
export APPS_MODULES=$APPS_SHARED/modules

#ADD HPCTK_MODULES TO MODULEPATH
if [[ ! $MODULEPATH == *"mnt/opt"* ]]; then
 for dir in $APPS_MODULES/* ; do
   # echo "DIR=$dir"
    export MODULEPATH=$MODULEPATH:$dir
 done
fi


#REMOVE DUPLICATES FROM MODULE PATH
MODULEPATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{MODULEPATH}))')"

#REMOVE DUPLICATES FROM PATH
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

alias ssh="ssh -X"
alias vi=vim
shopt -s direxpand

module load mdtk

#ENABLE DEVTOOLS 7 IF AVAILABLE
if [ -e /opt/rh/devtoolset-7/enable ]
then
 :
 source /opt/rh/devtoolset-7/enable
fi

#ENABLE LATEST VERSION OF GIT IF AVAILABLE
if [ -e /opt/rh/rh-git29/enable ]
then
 :
 source /opt/rh/rh-git29/enable
fi

source /mnt/opt/sge/ge-8.5.4/default/common/settings.sh

