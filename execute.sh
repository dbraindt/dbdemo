#! /bin/sh
FILE=$1

if [ -f $FILE ]; then
  mysql -u"$DBUSER" -p"$DBPASSWD" < $FILE
else
  printf "\nno such $FILE\n" 
fi


