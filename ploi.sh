cd /home/ploi/directory
# get the latest repository information
git fetch
# reset the current branch to the information from the remote repository
git reset origin/HEAD --hard
# pull the latest information
git pull origin main
# remove any branches that where deleted remotely
git prune


composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

## Install assets
unset NPM_CONFIG_PREFIX && . ~/.nvm/nvm.sh && nvm install
npm ci
npm run build

php artisan cache:clear
php artisan optimize
php artisan queue:restart

{RELOAD_PHP_FPM}

echo "🚀 Application deployed!"
