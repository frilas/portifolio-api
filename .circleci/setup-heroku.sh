#!/bin/bash

wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

cat > ~/.netrc << EOF
machine api.heroku.com
  login $HEROKU_LOGIN
  password $HEROKU_API_KEY
machine git.heroku.com
  login $HEROKU_LOGIN
  password $HEROKU_API_KEY
EOF

heroku git:remote -a $HEROKU_APP_NAME
git remote rename heroku production

heroku git:remote -a $HEROKU_APP_NAME_STAGING
git remote rename heroku staging

git remote -v show
