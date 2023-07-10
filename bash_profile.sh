# Topher's bash_profile
# To install, create `~/.bash_profile` with the contents `source ~/path/to/bash_profile`

alias ll='ls -la'
alias b='tput bel; sleep 1; tput bel; sleep 1; tput bel'
alias cheat='code ~/Sites/personal/cheatsheets/'
alias ssh-config='less ~/.ssh/config'

# alias throttle_200='throttle --up 100 --down 200 --rtt 1'
# alias throttle_800='throttle --up 800 --down 400 --rtt 1'
# alias throttle_stop='throttle --stop'

# Git shortcuts
alias ga='git add --all'
alias gs='git status'
alias gc='git commit'
alias gl='git log --pretty=format:"%h %ai (%an) | %s" --shortstat | ruby ~/Sites/personal/utilities/git-log-hoc.rb | less -RS'
alias gd='git diff'
alias gb='git branch'

alias g='grep --line-buffered' # It's insane that OSX disables this flag by default

# Rails shortcuts
alias rs='rails s'
alias rc='rails c'
alias rt='rails test'
export DISABLE_SPRING=true # I don't trust Spring.

# Phoenix shortcuts
alias mt='mix test'
alias mps='mix phx.server'
alias ph='echo "phantomjs --wd" && phantomjs --wd'
alias chr='echo "chromedriver" && chromedriver'
alias hexdocs='mix hex.docs offline'

alias j='bundle exec jekyll serve'

# WVTest Serverless AWS lambda for Puppeteer PDF generation
alias serverless='node_modules/serverless/bin/serverless.js'

export EDITOR='subl --wait'

export BUNDLER_EDITOR=subl

# Silence Mac OSX warning about updating to zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

# Retain iex history (thanks to https://stackoverflow.com/a/45405071/1729692)
export ERL_AFLAGS="-kernel shell_history enabled"

# MySQL
# I have MariaDB installed which you can start with `mysql.server start`
# though it should be autostarted via brew services.
alias start_mysql='sudo /usr/local/mysql/support-files/mysql.server restart'

# Add Git to PATH
export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"

# Mysql setup
export PATH="/usr/local/mysql/bin:$PATH"

# Add Mysql library tools to path
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib

# Add Homebrew postgresql to path
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"

# Set up Heroku Toolbelt in PATH
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# QT (still relevant?)
export PATH="/usr/local/opt/qt@5.5/bin:$PATH" # orig: $(brew --prefix qt@5.5)

# Elasticsearch (still relevant?)
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"

# Add homebrew Erlang to PATH
export PATH="/usr/local/opt/erlang@21/bin:$PATH"

# For Android app development (from Meteor.js setup guide)
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# Highlight Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Removed: "\u@\h"
export PS1="\n» \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

# Enable autocomplete for Git command / branches and SSH aliases
source ~/Sites/personal/utilities/.git-autocomplete.bash
source ~/Sites/personal/utilities/.ssh-autocomplete.bash

# Add asdf to PATH etc. This must be as late in bash_profile as possible.
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
