#!/bin/bash
echo $1
vncserver -kill $1
rm -f $HOME/vncserverC6.txt $HOME/vncserverNumberC6.txt



