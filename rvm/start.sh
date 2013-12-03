#!/bin/bash
source /usr/local/rvm/scripts/rvm
rvm use $RUBY-$RUBY_VERSION
if [[ ! -d $APP_DIR ]]; then
        if [[ ! -z $DEPLOY_KEY ]]; then
                printf %"s\n" "${DEPLOY_KEY}" > /.id_rsa
                chmod 600 /.id_rsa
                env --unset=DEPLOY_KEY
                echo "  IdentityFile    /.id_rsa" >> /etc/ssh/ssh_config
                echo "  StrictHostKeyChecking   no" >> /etc/ssh/ssh_config
        fi
        git clone $APP_REPO $APP_DIR && \
        rm /.id_rsa
        cd $APP_DIR && \
        rvm ${RUBY}-${RUBY_VERSION} do $INSTALL_CMD
fi
rvm ${RUBY}-${RUBY_VERSION} do $START_CMD
