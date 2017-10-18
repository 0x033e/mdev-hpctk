#!/bin/bash

VNCEXIST=`ps -u $USER | grep Xvnc`
#echo "USER=$USER"
#echo "VNCEXIST=$VNCEXIST"
if [ -z "$VNCEXIST" ]; then
 echo "VNCSERVER DOES NOT EXIST DELETING PREVIOUS RECORDS"
 rm -f $HOME/vncserver.txt $HOME/vncserverNumber.txt
else
 if [ ! -e $HOME/vncserverNumber.txt ]; then
  echo "VNC SERVER EXISTS BUT NO RECORDS, RECREATING RECORDS"
  vncserver -list >$HOME/vncserver.txt
  grep -E -o ".{0,0}:.{0,3}"  $HOME/vncserver.txt | cut -f1 -d " " | tail -n 1 > $HOME/vncserverNumber.txt
  sed -i 's/\.//' $HOME/vncserverNumber.txt
  sed -i 's/[[:alpha:].-]//g' $HOME/vncserverNumber.txt
 fi
fi

if [ ! -e $HOME/vncserverNumber.txt ]; then
 echo "CREATING NEW VNCSERVER"
 vncserver -SecurityTypes=VeNCrypt,TLSPlain -PlainUsers=$USER pam_service=login 2>$HOME/vncserver.txt
 sed -i -n '/Starting applications/,$p' $HOME/vncserver.txt
 grep -E -o ".{0,0}:.{0,3}"  $HOME/vncserver.txt | cut -f1 -d " " | head -n 1 > $HOME/vncserverNumber.txt
 sed -i 's/\.//' $HOME/vncserverNumber.txt
 sed -i 's/[[:alpha:].-]//g' $HOME/vncserverNumber.txt
fi



