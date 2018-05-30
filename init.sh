#!/bin/sh

echo "TODO: install mariadb 10.3 from mariadb community repo"
echo "TODO: set up master slave"
echo "TODO: secure install + make users"
echo "TODO: set up maxscale"


mysql -u root -p -e "
CREATE USER IF NOT EXISTS '$DBUSER'@'localhost' IDENTIFIED BY '$DBPASSWD';
GRANT ALL ON *.* TO '$DBUSER'@'localhost';
SHOW DATABASES;
SHOW GRANTS;
"
# so, localhost always works?
