#!/usr/bin/env sh

if [[ -d var/cache ]]; then
	echo "Removing cache folder"
	rm -rf var/cache
fi
# We ensure that config.php file doesn't exist. Indeed, installation of Magento will fail if it is already
# existing.
if [[ -f config.php ]]; then
	echo "Removing config.php file"
	rm config.php
fi

bin/magento setup:install \
	--base-url=http://magento23.local/ \
	--db-host=db\
	--db-name=magento\
	--db-user=root\
	--db-password=toor\
	--admin-firstname=admin \
	--admin-lastname=admin \
	--admin-email=admin@magento23.local\
	--admin-user=admin \
	--admin-password=admin123 \
	--use-rewrites=1 \
	--backend-frontname=admin \
	--cleanup-database
