#!/bin/bash

VNCEXIST=`ps -u $USER | grep Xvnc`
#echo "USER=$USER"
#echo "VNCEXIST=$VNCEXIST"
if [ -z "$VNCEXIST" ]; then
 echo "VNCSERVER DOES NOT EXIST DELETING PREVIOUS RECORDS"
 rm -f $HOME/vncserverC6.txt $HOME/vncserverNumberC6.txt
else
 if [ ! -e $HOME/vncserverNumberC6.txt ]; then
  echo "VNC SERVER EXISTS BUT NO RECORDS, RECREATING RECORDS"
  vncserver -list >$HOME/vncserverC6.txt
  grep -E -o ".{0,0}:.{0,3}"  $HOME/vncserverC6.txt | cut -f1 -d " " | tail -n 1 > $HOME/vncserverNumberC6.txt
  sed -i 's/\.//' $HOME/vncserverNumberC6.txt
  sed -i 's/[[:alpha:].-]//g' $HOME/vncserverNumberC6.txt
 fi
fi

if [ ! -e $HOME/vncserverNumberC6.txt ]; then
 echo "CREATING NEW VNCSERVER"
 vncserver -SecurityTypes=VeNCrypt,TLSPlain -PlainUsers=$USER pam_service=login 2>$HOME/vncserverC6.txt
 sed -i -n '/Starting applications/,$p' $HOME/vncserverC6.txt
 grep -E -o ".{0,0}:.{0,3}"  $HOME/vncserverC6.txt | cut -f1 -d " " | head -n 1 > $HOME/vncserverNumberC6.txt
 sed -i 's/\.//' $HOME/vncserverNumberC6.txt
 sed -i 's/[[:alpha:].-]//g' $HOME/vncserverNumberC6.txt
else
 echo "VNCSERVER ALREADY EXISTS; DOING NOTHING"
fi



