cd /home/ploi/directory
git fetch
git reset origin/main --hard
git pull origin main
composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

## Install assets
unset NPM_CONFIG_PREFIX && . ~/.nvm/nvm.sh && nvm install
npm ci
npm run build

## Do laravel things
php artisan migrate --force
php artisan optimize
php artisan queue:restart

{RELOAD_PHP_FPM}


echo "🚀 Application deployed!"
