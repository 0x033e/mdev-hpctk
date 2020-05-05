#!/bin/bash

VNCEXIST=`ps -u $USER | grep Xvnc`
#echo "USER=$USER"
#echo "VNCEXIST=$VNCEXIST"
if [ -z "$VNCEXIST" ]; then
 echo "VNCSERVER DOES NOT EXIST DELETING PREVIOUS RECORDS"
 rm -f $HOME/vncserverRDK.txt $HOME/vncserverNumberRDK.txt
else
 if [ ! -e $HOME/vncserverNumberRDK.txt ]; then
  echo "VNC SERVER EXISTS BUT NO RECORDS, RECREATING RECORDS"
  vncserver -list >$HOME/vncserverRDK.txt
  grep -E -o ".{0,0}:.{0,3}"  $HOME/vncserverRDK.txt | cut -f1 -d " " | tail -n 1 > $HOME/vncserverNumberRDK.txt
  sed -i 's/\.//' $HOME/vncserverNumberRDK.txt
  sed -i 's/[[:alpha:].-]//g' $HOME/vncserverNumberRDK.txt
  cp -f $HOME/vncserverNumberRDK.txt /home/$USER/vncserverNumberRDK.txt
  cp -f $HOME/vncserverRDK.txt /home/$USER/vncserverRDK.txt
 fi
fi

if [ ! -e $HOME/vncserverNumberRDK.txt ]; then
 echo "CREATING NEW VNCSERVER"
 vncserver -SecurityTypes=VeNCrypt,TLSPlain -PlainUsers=$USER pam_service=login 2>$HOME/vncserverRDK.txt
 sed -i -n '/Starting applications/,$p' $HOME/vncserverRDK.txt
 grep -E -o ".{0,0}:.{0,3}"  $HOME/vncserverRDK.txt | cut -f1 -d " " | head -n 1 > $HOME/vncserverNumberRDK.txt
 sed -i 's/\.//' $HOME/vncserverNumberRDK.txt
 sed -i 's/[[:alpha:].-]//g' $HOME/vncserverNumberRDK.txt
 cp -f $HOME/vncserverNumberRDK.txt /home/$USER/vncserverNumberRDK.txt
 cp -f $HOME/vncserverRDK.txt /home/$USER/vncserverRDK.txt
else
 echo "VNCSERVER ALREADY EXISTS; DOING NOTHING"
fi



