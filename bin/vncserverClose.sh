#!/bin/bash
echo $1
vncserver -kill $1
rm -f $HOME/vncserver.txt $HOME/vncserverNumber.txt



