#!/bin/bash
shell=`/bin/basename \`/bin/ps -p $$ -ocomm=\``
if [ -f /usr/share/Modules/init/$shell ]
then
  . /usr/share/Modules/init/$shell
else
  . /usr/share/Modules/init/sh
fi

#echo "MODULEPATH=$MODULEPATH"

module () {
    eval `/usr/bin/modulecmd bash $*`
}

module load hpctk
module load mdtk

TIME_DATE=`date "+%-R%d%m%y"`

