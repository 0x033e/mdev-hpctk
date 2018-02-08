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
else
 #REMOVE DUPLICATES FROM MODULE PATH
 MODULEPATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{MODULEPATH}))')"
fi

export APPS_SHARED=/mnt/opt/
export APPS_MODULES=$APPS_SHARED/modulefiles

alias ssh="ssh -X"
alias vi=vim

module load mdtk

#REMOVE DUPLICATES FROM PATH
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

