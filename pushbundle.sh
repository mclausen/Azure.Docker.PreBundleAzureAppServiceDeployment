#!/bin/bash
cd /bundle

GIT_PUBLISHING_USER="\$$AZURE_WEB_APP_NAME"
GIT_REMOTE_URL="$AZURE_WEB_APP_NAME.scm.azurewebsites.net:443/$AZURE_WEB_APP_NAME.git"
GIT_CREDS="$GIT_PUBLISHING_USER:$GIT_PUBLISHING_PASSWORD"
GIT_REMOTE="https://$GIT_CREDS@$GIT_REMOTE_URL"

git remote add origin $GIT_REMOTE
git push origin master --force
echo "hello $SOMEONE!"