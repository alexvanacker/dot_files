# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# PATH variable handling
#export DEVENV=$HOME/devenv
#export MAVEN_HOME=$DEVENV/apache-maven/apache-maven-3.6.1
#export ECLIPSE_HOME=$DEVENV/eclipse/jee-oxygen/eclipse
#export REDIS_HOME=$DEVENV/redis/redis-4.0.2/
#export GRADLE_HOME=$DEVENV/gradle/gradle-4.3.1
#export TERRAFORM_HOME=$DEVENV/terraform/
#export RUST=$HOME/.cargo/bin
#export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-2019-07-19-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
#export EXERCISM=$DEVENV/exercism-cli
#export LEIN=$DEVENV/lein
#export PACKER=$DEVENV/packer
#export ALLURE=$DEVENV/allure-2.9.0
#export GO_PATH=$DEVENV/go
#export GIT_FILTER_REPO=$HOME/git/git-filter-repo
#
#export PATH=~/bin:$GIT_FILTER_REPO:$MAVEN_HOME/bin:$REDIS_HOME/bin:$GRADLE_HOME/bin:$TERRAFORM_HOME:$RUST:$EXERCISM:$LEIN:$PACKER:$ALLURE/bin:$GO_PATH/bin:$PATH

# Use "config" to version dot files.
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# Path to your oh-my-zsh installation.
  export ZSH=/home/alexvanacker/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh_custom

# Install notify and command-time custom plugins
export CUSTOM_NOTIFY_PATH=$ZSH_CUSTOM/plugins/notify
if [[ ! -d $CUSTOM_NOTIFY_PATH ]];
then
    echo "ZSH: Installing notify plugin..."
    git clone git@github.com:marzocchi/zsh-notify.git $CUSTOM_NOTIFY_PATH
fi

export CUSTOM_COMMAND_TIME_PATH=$ZSH_CUSTOM/plugins/command-time
if [[ ! -d $CUSTOM_COMMAND_TIME_PATH ]];
then
    echo "ZSH: Installing command-time plugin..."
    git clone https://github.com/popstas/zsh-command-time.git $CUSTOM_COMMAND_TIME_PATH
fi


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git notify rust cargo command-time
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases



# Do not show user/machine if default user and local machine
export DEFAULT_USER=alexvanacker
prompt context(){}

# Use better colors
eval `dircolors ~/.dir_colors/dircolors`


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/alexvanacker/.nvm/versions/node/v8.14.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/alexvanacker/.nvm/versions/node/v8.14.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/alexvanacker/.nvm/versions/node/v8.14.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/alexvanacker/.nvm/versions/node/v8.14.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/alexvanacker/.nvm/versions/node/v8.14.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/alexvanacker/.nvm/versions/node/v8.14.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/alexvanacker/.sdkman"
[[ -s "/home/alexvanacker/.sdkman/bin/sdkman-init.sh" ]] && source "/home/alexvanacker/.sdkman/bin/sdkman-init.sh"
