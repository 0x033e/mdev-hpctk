#!/bin/bash

module () {
    eval `/usr/bin/modulecmd bash $*`
}

export HPCTK_HOME=/tools_shared/hpctk
export HPCTK_BIN=$HPCTK_HOME/bin
export HPCTK_SCRIPTS=$HPCTK_HOME/scripts
export HPCTK_MODULES=$HPCTK_HOME/modules

#echo $HPCTK_BIN
export PATH=$PATH:$HPCTK_BIN
#echo $PATH

export MODULEPATH=$MODULEPATH:$HPCTK_MODULES

alias ssh="ssh -X"
alias vi=vim

module load mdtk


