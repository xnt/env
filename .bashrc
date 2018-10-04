# NVM
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
source ~/.profile

# Aliases
alias cb='~/Code/Scripts/clean_nonrc_branches.rb'
alias cr='~/Code/Scripts/cr_selector.rb $1'
alias json='python -m json.tool'
alias nuke="rails db:environment:set RAILS_ENV=test; rails db:drop RAILS_ENV=test; sudo -u postgres createdb -O appuser pointshound_test; rails db:migrate RAILS_ENV=test"
alias pt='cd /Users/vicente.plata/projects'
alias ptb='pt; cd travel-rails'
alias ptf='pt; cd travel-react'
alias rerun='bin/testrbl -Itest $1'
alias rr='cd /vagrant'
alias rs='rails s Puma'
alias xml='xmllint --format -'
alias yph='yarn dev --client=ph'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Custom prompt
# Based on http://ezprompt.net/
bold=$(tput bold)
normal=$(tput sgr0)

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

export PS1="\u@${bold}\[\e[37;40m\]\`parse_git_branch\`\[\e[m\]${normal}:\W\\$ "
