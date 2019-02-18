#!/bin/sh

printf "\nrun as root\n"

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash

sudo yum -y install mariadb mariadb-server mariadb-client
sudo yum -y install python36-devel # for pip install mysqlclient
sudo yum -y install mariadb-devel # for pip install mysqlclient
sudo yum -y install MariaDB-shared # for pip install mysqlclient

systemctl status mariadb
systemctl start mariadb


mysql_secure_installation 

