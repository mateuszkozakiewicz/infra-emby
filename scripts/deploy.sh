rsync -avz --quiet --exclude 'scripts' --exclude '.travis.yml' --exclude 'env' $TRAVIS_BUILD_DIR/ build@$SSH_HOST:/srv/infrastructure
ssh build@$SSH_HOST 'cd /srv/infrastructure; docker-compose up -d'