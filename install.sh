#!/bin/bash

if [ ! -f "composer.json" ]; then
    echo "Please run this script from the project root directory."
    exit 1
fi

echo "Installing Composer dependencies..."
composer install

php artisan zenith:install
