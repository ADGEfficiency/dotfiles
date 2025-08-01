#!/usr/bin/env zsh

# a collection of Bash functions

mcd() {
  mkdir -p $1 && cd $1
}

# grep with a few more lines
# $ gl todo ~/code
gl() {
  local pattern=$1
  local directory=$2
  local context_lines=${3:-0}
  rg --hidden --smart-case --line-buffered -A "$context_lines" "$pattern" "$directory"
}

# re-run a shell command every time after a file changes in directory
entrr() {
    if [ $# -lt 2 ]; then
        echo "Usage: watch_and_seed <content_directory> <python_script>"
        return 1
    fi
    directory="$1"
    cmd="$2"
    ls "$directory"/* | entr -s "$cmd"
}

# move a desktop screenshot to pwd
move-screenshot() {
  bash ~/dotfiles/scripts/move-macos-desktop-screenshot.sh $1
}

# search for files to open in $EDITOR
s() {
  bash ~/dotfiles/scripts/search.sh
}

# open the todo note - either general or project specific
todo() {
  bash ~/dotfiles/scripts/todo.sh $1
}

# create a new atomic note
atomic() {
  bash ~/dotfiles/scripts/atomic.sh $1
}

# search for project notes
project() {
  bash ~/dotfiles/scripts/search.sh $PERSONAL_PATH/project
}
alias proj=project

# open a daily note
day() {
  bash ~/dotfiles/scripts/day.sh
}

# open the weekly note
week() {
  "$EDITOR" $PERSONAL_PATH/this-week.md
}

# TODO docs
v() {
  source .venv/bin/activate
  which python
}
alias vinit=v
vneu() {
  uv venv --python 3.11.10
}
vdel() {
  rm .venv
}

# change a github remote - useful when changing to ssh after cloning
remote() {
  git remote set-url origin $1
}

# create branch if it doesn't exist, otherwise change to branch
gb() {
  if git show-ref --verify --quiet refs/heads/"$1"; then
    echo "Switching to branch '$1'"
    git checkout "$1"
  else
    echo "Creating and switching to new branch '$1'"
    git checkout -b "$1"
  fi
}

# git add -u, commit and push
gac() {
  git add -u && git commit -m "$1" && git push origin
}

# Show a random quote/snippet from two files
# Combines quotes.md and random_snippets.md from personal repo
quote() {
  QUOTES="$PERSONAL_PATH/resource/quotes.md"
  SNIPPETS="$PERSONAL_PATH/resource/random_snippets.md"

  # Get all non-empty lines from both files, skipping YAML headers
  ALL_LINES=$(tail -n +6 "$QUOTES" "$SNIPPETS" | grep -v "^$")

  # Count total lines
  NUM_LINES=$(echo "$ALL_LINES" | wc -l)

  # Select a random line number
  LINE=$((1 + RANDOM % NUM_LINES))

  # Print the selected line
  echo -n "$ALL_LINES" | sed -n "${LINE}p"
}


#  virtual envs

#  make a pyenv virtual env
#  $ make_env 3.10.6 nemdata
make_env() {
  VERSION=$1
  NAME=$2
  pyenv virtualenv $VERSION $NAME
	echo $NAME > .python-version
}

#  make a pyenv virtual env and install pip requirements
make_env_pip() {
  pyenv virtualenv $1 $2
	echo $2 > .python-version
	source activate $2
	pip install --upgrade pip
	pip install -r requirements.txt
}

#  delete a pyenv virtual env
#  $ delete_env nemdata
delete_env() {
  pyenv virtualenv-delete $1
}


#  utilities for viewing files

json() {
  cat $1 | jq | less
}

csv() {
  cat $1 | ov --column-delimiter "," --column-mode --column-rainbow --header 1
}

parquet() {
  python -c "import pandas as pd; df = pd.read_parquet('${1}'); print(df.columns); print(df.iloc[:3, :9])"
}

parqueti() {
  python -ic "import pandas as pd; df = pd.read_parquet('${1}'); print(df.columns); print(df.iloc[:3, :9])"
}

parquets3() {
  python -ic "from feeds.grid_io.files import S3Parquet; df = S3Parquet('${1}', '${2}').read(); print(df.columns); print(df.iloc[:3, :7])"
}


#  ssh tunnels

#  with key
tunnelk() {
  port=$1
  userhost=$2
  key=$3
  ssh -i $key -N -L "localhost:${port}:localhost:${port}" $userhost
}

#  no key
tunnelnk() {
  port=$1
  userhost=$2
  ssh -N -L "localhost:${port}:localhost:${port}" $userhost
}


#  tmux

tn () {
    CLEAN=$(pwd | tr -d ' ')
    NAME="$(basename $CLEAN)"
    tmux new -s $NAME -c "$(pwd)"
}
alias t='tn'


#  docker

docker_sh () {
    docker exec -it $1 /bin/sh
}

docker_build () {
    NAME=$1
    DOCKERFILE=$2
    docker build -t $NAME . -f $DOCKERFILE --platform linux/amd64
}

docker_run () {
    NAME=$1
    COMMAND=$2
    docker run -it $NAME $COMMAND --platform linux/amd64
}

docker_ip () {
    NAME=$1
    docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $NAME
}

docker_build_run () {
    NAME=$1
    DOCKERFILE=$2
    COMMAND=$3
    build-docker $1 $2
    run-docker $1 $3
}

docker_ls () {
  docker network list
  docker volume list
}

docker_exec_last () {
  docker exec -it "$(docker ps | awk 'NR==2{print $1}')" /bin/bash
}
