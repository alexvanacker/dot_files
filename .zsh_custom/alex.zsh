# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#


### Shortcuts
alias dev="cd ~/devenv"
alias mygit="cd ~/git"

### CUSTOM
alias zshconfig="vim ~/.zshrc"
alias gpfwl='git push --force-with-lease'
alias grbia='git rebase -i --autosquash'
alias grsprint="gfa && git rebase -i origin/sprint"

### RUST
alias cargodt="RUST_BACKTRACE=1 cargo test"

function grho() {
    [[ "$#" != 1 ]] && local b="$(git_current_branch)"
    gfa
    echo "git reset --hard origin/${b:=$1}"
    git reset --hard origin/${b:=$1} 
    git status
}

function synct() {
    echo "Syncing torrents from raspberry"
    rsync -av --progress rasp:/data/torrents/torrents-complete/ /home/alexvanacker/Videos/
}

function gbra() {
    echo "Getting remote branches..."
    for k in `git branch -r|awk '{print $1}'`;do echo `git show --pretty=format:"%Cgreen%ci %Cblue%cr %Cred%cn %Creset" $k|head -n 1`\\t$k;done|sort -r
}

