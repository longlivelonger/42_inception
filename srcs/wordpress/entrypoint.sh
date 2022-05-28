#!/bin/sh

if [ -f setup.flag ]; then
	echo "Setup wp-config.php and users"

	sed -i "s/{{DB_NAME}}/${DB_NAME}/g" /var/www/wordpress/wp-config.php
	sed -i "s/{{DB_USER}}/${DB_USER}/g" /var/www/wordpress/wp-config.php
	sed -i "s/{{DB_PASSWORD}}/${DB_PASSWORD}/g" /var/www/wordpress/wp-config.php
	sed -i "s/{{DB_HOST}}/${DB_HOST}/g" /var/www/wordpress/wp-config.php

	chown nobody:nogroup /var/www/wordpress/wp-config.php
	chmod 644 /var/www/wordpress/wp-config.php

	if ! mysqladmin -u $DB_USER -p$DB_PASSWORD -h $DB_HOST -w=100 ping &> /dev/null; then
		echo "Cannot connect to database"
		exit 1
	fi

	wp core install --url="$WP_URL" --title="$WP_TITLE" \
		--admin_user=$WP_ADMIN_USER --admin_password=$WP_USER_PASSWORD \
		--admin_email=${WP_ADMIN_USER}@example.com --skip-email

	wp user create $WP_SECOND_USER ${WP_SECOND_USER}@example.com \
		--role=editor --user_pass=$WP_USER_PASSWORD

	rm -f setup.flag
fi

exec php-fpm7 --nodaemonize