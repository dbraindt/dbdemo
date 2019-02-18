#! /bin/sh

# TODO: either file or statement

FILE=$1

if [ -n "$DBUSER" -a -n "$DBPASSWD" -a -n "$FILE" ]; then
    if [ -f $FILE ]; then
      mysql -u"$DBUSER" -p"$DBPASSWD" < $FILE
    else
      printf "\nno such $FILE\n" 
    fi;
else
    printf "\n DBUSER or DBPASSWD is not set\n"
fi

