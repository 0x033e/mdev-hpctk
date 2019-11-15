#!/bin/bash
echo $1
vncserver -kill $1
rm -f $HOME/vncserverRDK.txt $HOME/vncserverNumberRDK.txt



