alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias ......='cd ../../../../../../'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ga='git add'
alias gbl='git branch -l'
alias gchs='git config credential.helper store'
alias gd='git diff'
alias gfa='git fetch --all'
alias gl1='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
alias gl2='git log --graph --oneline --decorate --all'
alias gl4='git log -p -1'
alias gl5='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short -p'
alias gl6='git log --name-only --oneline'
alias gl7='git log --oneline --all --graph --decorate $*'
alias gp='git pull'
alias gpr='git pull --rebase'
alias grep='grep --color=auto'
alias gs='git status'
alias gsd='git stash drop'
alias gsl='git stash list'
alias gspm='git stash push -m $1'
alias gurl='git remote show origin'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias m='mvn clean install -Dmaven.test.skip=true -Dmaven.native.skip=true'
alias mt='mvn clean install -Dmaven.native.skip=true -DargLine="-XX:+StartAttachListener"'
alias port='netstat -tulanp'
alias search='grep -Ril '
alias sp='cd /media/D/codebase/zenworks_linux/server-spoke/server/'
alias which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias yta='youtube-dl -x --audio-format mp3 --audio-quality 0 '
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias mvn2='docker container run -it --rm --network=host -e HTTP_PROXY -e HTTPS_PROXY -e NO_PROXY -v ~/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/wd -w /wd devimages/buildenv-ui:3.2.0-SNAPSHOT mvn'
alias nvim='/home/linuxbrew/.linuxbrew/bin/nvim'
alias zplug="docker pull u1and0/zplug && \
docker run -it --rm \
  -v \$(pwd):/work \
  -v ~/.config/nvim:/home/u1and0/.config/nvim \
  -v ~/.local/share/nvim:/home/u1and0/.local/share/nvim \
  -v ~/.cache/nvim:/home/u1and0/.cache/nvim \
  -v ~/.zshrc:/home/u1and0/.zshrc \
  -v ~/.oh-my-zsh:/home/u1and0/.oh-my-zsh \
  -v ~/oh-my-zsh-custom:/home/u1and0/oh-my-zsh-custom \
  -w /work u1and0/zplug"


