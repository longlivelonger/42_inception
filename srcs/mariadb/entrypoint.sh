#!/bin/sh

if [ -f setup.sql ]; then
	echo "Setup wordpress database"

	sed -i "s/{{DB_NAME}}/${DB_NAME}/g" setup.sql
	sed -i "s/{{DB_USER}}/${DB_USER}/g" setup.sql
	sed -i "s/{{DB_PASSWORD}}/${DB_PASSWORD}/g" setup.sql
	sed -i "s/{{DB_ROOT_PASSWORD}}/${DB_ROOT_PASSWORD}/g" setup.sql

	mkdir /var/log/mysql /run/mysqld
	chown -R mysql:mysql /var/lib/mysql /var/log/mysql /run/mysqld
	mariadb-install-db --auth-root-authentication-method=normal &> /dev/null

	mysqld --user=mysql --bootstrap < setup.sql
	rm -f setup.sql
fi

exec mysqld_safe