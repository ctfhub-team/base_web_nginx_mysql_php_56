#!/bin/sh

# Create database and user
# mysql -e "create database ctfhub;" -uroot -proot
# mysql -e "grant select,insert,update,delete on ctfhub.* to ctfhub@'127.0.0.1' identified by 'ctfhub';" -uroot 

# Set dynamic FLAG

# if [[ -f /var/www/html/db.sql ]]; then
#     sed -i "s#FLAG#$FLAG#" /var/www/html/db.sql || true
# fi

# mysql -e "USE $FLAG_SCHEMA;ALTER TABLE FLAG_TABLE CHANGE FLAG_COLUMN $FLAG_COLUMN CHAR(128) NOT NULL DEFAULT 'not_flag';ALTER TABLE FLAG_TABLE RENAME $FLAG_TABLE;INSERT $FLAG_TABLE VALUES('$FLAG');" -uroot -proot
# mysql -e "USE $FLAG_SCHEMA;UPDATE $FLAG_TABLE SET $FLAG_COLUMN=$FLAG" -uroot -proot


# Reset mysql root's passwors as random string
PASS="toor$(date +%N)$RANDOM"
mysqladmin -uroot -proot password $PASS

export FLAG=not_flag
FLAG=not_flag

rm -f /flag.sh