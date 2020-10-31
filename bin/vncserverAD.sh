#!/bin/bash

VNCEXIST=`ps -u $USER | grep Xvnc`
#echo "USER=$USER"
#echo "VNCEXIST=$VNCEXIST"
if [ -z "$VNCEXIST" ]; then
 echo "VNCSERVER DOES NOT EXIST DELETING PREVIOUS RECORDS"
 rm -f $HOME/vncserverAD.txt $HOME/vncserverNumberAD.txt
else
 if [ ! -e $HOME/vncserverNumberAD.txt ]; then
  echo "VNC SERVER EXISTS BUT NO RECORDS, RECREATING RECORDS"
  vncserver -list >$HOME/vncserver.txt
  grep -E -o ".{0,0}:.{0,3}"  $HOME/vncserverAD.txt | cut -f1 -d " " | tail -n 1 > $HOME/vncserverNumberAD.txt
  sed -i 's/\.//' $HOME/vncserverNumberAD.txt
  sed -i 's/[[:alpha:].-]//g' $HOME/vncserverNumberAD.txt
 fi
fi

if [ ! -e $HOME/vncserverNumberAD.txt ]; then
 echo "CREATING NEW VNCSERVER"
 vncserver -SecurityTypes=VeNCrypt,TLSPlain -PlainUsers=$USER pam_service=login 2>$HOME/vncserverAD.txt
 sed -i -n '/Starting applications/,$p' $HOME/vncserverAD.txt
 grep -E -o ".{0,0}:.{0,3}"  $HOME/vncserverAD.txt | cut -f1 -d " " | head -n 1 > $HOME/vncserverNumberAD.txt
 sed -i 's/\.//' $HOME/vncserverNumberAD.txt
 sed -i 's/[[:alpha:].-]//g' $HOME/vncserverNumberAD.txt
else
 echo "VNCSERVER ALREADY EXISTS; DOING NOTHING"
fi



