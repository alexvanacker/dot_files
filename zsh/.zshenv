export DEVENV=$HOME/devenv
export MAVEN_HOME=$DEVENV/apache-maven-3.9.4
export ECLIPSE_HOME=$DEVENV/eclipse/jee-oxygen/eclipse
export REDIS_HOME=$DEVENV/redis/redis-4.0.2/
export GRADLE_HOME=$DEVENV/gradle/gradle-4.3.1
export TERRAFORM_HOME=$DEVENV/terraform/
export RUST=$HOME/.cargo/bin
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-2019-07-19-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export EXERCISM=$DEVENV/exercism-cli
export LEIN=$DEVENV/lein
export PACKER=$DEVENV/packer
export ALLURE=$DEVENV/allure-2.9.0
export GO_PATH=$DEVENV/go
export GIT_FILTER_REPO=$HOME/git/git-filter-repo
export LIQUIBASE=$DEVENV/liquibase
export GEM_HOME=$HOME/gems

export PATH=$GEM_HOME/bin:~/bin:$LIQUIBASE:$GIT_FILTER_REPO:$MAVEN_HOME/bin:$REDIS_HOME/bin:$GRADLE_HOME/bin:$TERRAFORM_HOME:$RUST:$EXERCISM:$LEIN:$PACKER:$ALLURE/bin:$GO_PATH/bin:$PATH
