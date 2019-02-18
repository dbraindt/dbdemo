#!/bin/sh





if [ -n "$1" -a -n "$2" ]; then
    printf "\n Setting DBUSER & DBPASSWD \n";
    DBUSER=$1
    DBPASSWD=$2
else
    printf "\nthis script will read user/password and create a new db user\n";
    printf "\nuse like so: ./db_init.sh dbusername dbpassword \n";
    printf "\nor export DBUSER and DBPASSWD, then ./db_init.sh \n";
fi


printf "\ntest if environment variables DBUSER and DBPASSWD are set\n"

printf "\nDBUSER: "
if [ $DBUSER ]; then
    printf "OK!\n"
else
    printf "NOT SET!\n"
    exit 1
fi

printf "\nDBPASSWD: "
if [ $DBPASSWD ]; then
    printf "OK!\n"
else
    printf "NOT SET!\n"
    exit 1
fi

printf "\n\n"

printf "\ncreating a user\n"


mysql -u root -p -e "
CREATE USER IF NOT EXISTS '$DBUSER'@'localhost' IDENTIFIED BY '$DBPASSWD';
GRANT ALL ON *.* TO '$DBUSER'@'localhost';
SHOW DATABASES;
SHOW GRANTS;
"
# so, localhost always works?
