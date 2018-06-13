#!/bin/tcsh

setenv HPCTK_HOME /mnt/opt/hpctk
setenv HPCTK_BIN $HPCTK_HOME/bin
setenv HPCTK_SCRIPTS $HPCTK_HOME/scripts
setenv HPCTK_MODULES $HPCTK_HOME/modules
setenv TK_BASE "/mnt/gpfs/backup"

#echo $HPCTK_BIN
if ( -e $HPCTK_BIN ) then
 setenv PATH "$PATH"\:"$HPCTK_BIN"
endif

if ( -e /usr/lpp/mmfs/bin ) then
 setenv PATH $PATH\:/usr/lpp/mmfs/bin/
endif


#ADD HPCTK_MODULES TO MODULEPATH
if ($MODULEPATH =~ *"hpctk"* ) then
 :
else
 setenv MODULEPATH $MODULEPATH\:$HPCTK_MODULES
endif


setenv APPS_SHARED /mnt/opt/Centos7
setenv APPS_MODULES $APPS_SHARED/modules


#ADD HPCTK_MODULES TO MODULEPATH
foreach dir ($APPS_MODULES/*)
    setenv MODULEPATH $MODULEPATH\:$dir
end



#REMOVE DUPLICATES FROM MODULE PATH
#setenv MODULEPATH "$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{MODULEPATH}))')"
set MODULEPATH=(`echo $MODULEPATH | tr ' ' '\n' | sort | uniq | tr '\n' ' '`)

#REMOVE DUPLICATES FROM PATH
#setenv PATH "$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
set PATH=(`echo $PATH | tr ' ' '\n' | sort | uniq | tr '\n' ' '`)

alias ssh "ssh -X"
alias vi vim
#shopt -s direxpand


#--- LOAD MODULES FROM USER GROUPS ---

module load mdtk

set USER_STRING=`id $USER`
#echo $USER_STRING


if ( "$USER_STRING" =~ *"surge"*) then
#if ($USER_STRING =~ *"surge"* ) then
 module load surgetk
endif

#--- END MODULE SECTIONS ---

#ENABLE DEVTOOLS 7 IF AVAILABLE
#if ( -e /opt/rh/devtoolset-7/enable ) then
 #:
 #source /opt/rh/devtoolset-7/enable
 #alias sudo /usr/bin/sudo
#endif

#ENABLE LATEST VERSION OF GIT IF AVAILABLE
#if ( -e /opt/rh/rh-git29/enable ) then
 #:
 #source /opt/rh/rh-git29/enable
#endif

if ( -e /mnt/opt/sge/uge-8.5.5/default/common/settings.sh ) then
 :
 source /mnt/opt/sge/uge-8.5.5/default/common/settings.csh
endif

