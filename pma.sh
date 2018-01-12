#!/bin/bash

if ! [ -f /home/vagrant/.phpmyadmin ]
then
    echo 'Downloading phpMyAdmin 4.7.7'
    
    curl -#L https://files.phpmyadmin.net/phpMyAdmin/4.7.7/phpMyAdmin-4.7.7-english.tar.gz -o phpmyadmin.tar.gz

    mkdir phpmyadmin && tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1

    rm phpmyadmin.tar.gz
else    
    echo "phpMyAdmin installed!"
    
    CMD=/vagrant/scripts/serve-laravel.sh
    CMD_CERT=/vagrant/scripts/create-certificate.sh

    if [ ! -f $CMD ]; then
        # Fallback for older Homestead versions
        CMD=/vagrant/scripts/serve.sh
    else
        # Create an SSL certificate
        sudo bash $CMD_CERT phpmyadmin.test
    fi

    sudo bash $CMD phpmyadmin.test $(pwd)/phpmyadmin  skipped_variables skipped_variable 7.2

    sudo service nginx reload
fi
