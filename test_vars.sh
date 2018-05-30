#!/bin/sh

printf "\nTODO: test all env vars are set\n"
# return 1/0 ?

printf "\nDBUSER: "
if [ $DBUSER ]; then
    printf "OK!"
else
    printf "NOT SET!"
fi

printf "\nDBPASSWD: "
if [ $DBPASSWD ]; then
    printf "OK!"
else
    printf "NOT SET!"
fi

#fake
printf "\nDBKEY: "
if [ $DBKEY ]; then
    printf "OK!"
else
    printf "NOT SET!"
fi

printf "\n\n"
