#!/bin/bash
PROJECT="$1"

PROJECT_TEMP="/tmp/$PROJECT.temp.txt"

echo "name $PROJECT" >$PROJECT_TEMP
echo "oticket 0" >>$PROJECT_TEMP
echo "fshare 0" >>$PROJECT_TEMP
echo "acl NONE" >>$PROJECT_TEMP
echo "xacl NONE" >>$PROJECT_TEMP

