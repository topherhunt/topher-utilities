# Topher's bash_profile
# To install, create `~/.bash_profile` with the contents `source ~/path/to/bash_profile`

# Git shortcuts
alias ga='git add --all'
alias gs='git status'
alias gc='git commit'
alias gl='git log --pretty=format:"%h %ai (%an) | %s" --shortstat | ruby ~/Sites/personal/utilities/git-log-hoc.rb | less -RS'
alias gd='git diff'
alias gb='git branch'

# Rails shortcuts
alias rs='rails s'
alias rc='rails c'
alias be='bundle exec'
alias rt='ruby -Itest' # mainly for Glassfrog
alias webpack='./bin/webpack-dev-server'

alias cheat='subl ~/Sites/personal/cheatsheets/'
alias lint="./node_modules/.bin/eslint"
# alias morning='ruby ~/Sites/personal/utilities/mom/morning_routine.rb'

alias y1='youtube-dl -f 140'
alias y2='youtube-dl -f 17'

# MySQL
# I have MariaDB installed which you can start with `mysql.server start`
# though it should be autostarted via brew services.
alias start_mysql='sudo /usr/local/mysql/support-files/mysql.server restart'

# PostgreSQL
# I installed Postgres via Homebrew. Check that it's running with: `psql -h localhost`
# No manual commands should be necessary.

# Add Git to PATH
export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"
# Add Mysql executables to PATH
export PATH="/usr/local/mysql/bin:$PATH"
# Add Postgres.app to PATH
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"
# Set up Heroku Toolbelt in PATH
export PATH="/usr/local/heroku/bin:$PATH"
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# Add Mysql library tools to path
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib

export DISABLE_THINKING_SPHINX="true"

# Highlight Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Removed: "\u@\h"
export PS1="» \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

# Enable autocomplete for Git command / branches and SSH aliases
source ~/Sites/personal/utilities/.git-autocomplete.bash
source ~/Sites/personal/utilities/.ssh-autocomplete.bash

# Hook in Kiex (Elixir version) scripts
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
