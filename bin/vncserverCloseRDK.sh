#!/bin/bash
echo $1
vncserver -kill $1
rm -f $HOME/vncserverRDK.txt $HOME/vncserverNumberRDK.txt
rm -f $HOME/$USER/vncserverRDK.txt $HOME/$USER/vncserverNumberRDK.txt



