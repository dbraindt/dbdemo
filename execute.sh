#! /bin/sh
FILE=$1

if [ -f $FILE ]; then
  mysql -uroot -p village < $FILE
else
  echo "nah" 
fi


