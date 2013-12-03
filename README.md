# Docker Ruby-App #

## Use ##
By default this will build a container using Rubinius.  This is set using an env var in the Dockerfile.  Feel free to copy this Dockerfile and change that to whatever ruby implementation and version you want.

Use these environment vars to configure container:

###APP_REPO###
The git URL for your app

###APP_DIR###
Directory you want the app to run from (eg /opt/awesomeapp)

###INSTALL_CMD###
The command use to install/setup your app (e.g. bundle exec rake install)

###START_CMD###
Command used to start the app (e.g. bundle exec rake start)

###DEPLOY_KEY###
ssh private key (the actual key, not the file) required to access the git repo


###Example###
`docker run -d -e APP_REPO=git@github.com:githubuser/repo.git -e APP_DIR=/opt/myapp -e DEPLOY_KEY=$(cat ~/.ssh/id_dsa)`
