#!/usr/bin/env zsh

function entrr() {
    if [ $# -lt 2 ]; then
        echo "Usage: watch_and_seed <content_directory> <python_script>"
        return 1
    fi
    directory="$1"
    cmd="$2"
    ls "$directory"/* | entr -s "$cmd"
}

todo() {
  bash ~/dotfiles/scripts/todo.sh $1
}

# change a github remote - useful when changing to ssh after cloning
remote() {
  git remote set-url origin $1
}

#  virtual envs

#  make a pyenv virtual env
#  `$ make_env 3.10.6 nemdata`
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

delete_env() {
  pyenv virtualenv-delete $1
}

#  utilities for viewing files

json() {
  cat $1 | jq | less
}

csv() {
  cat $1 | head -n 8 | column -t -s,
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
    NAME=$($HOME/.pyenv/versions/general/bin/zxpy $HOME/dotfiles/scripts/random-name.py)
    NAME=$(basename $(pwd))
    tmux new -s $NAME -c $(pwd)
}
alias t='tn'

#  docker

docker-sh () {
    docker exec -it $1 /bin/sh
}

docker-build () {
    NAME=$1
    DOCKERFILE=$2
    docker build -t $NAME . -f $DOCKERFILE --platform linux/amd64
}

docker-run () {
    NAME=$1
    COMMAND=$2
    docker run -it $NAME $COMMAND --platform linux/amd64
}

docker-ip () {
    NAME=$1
    docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $NAME
}

docker-build-run () {
    NAME=$1
    DOCKERFILE=$2
    COMMAND=$3
    build-docker $1 $2
    run-docker $1 $3
}

docker-ls () {
  docker network list
  docker volume list
}

docker-exec-last () {
  docker exec -it "$(docker ps | awk 'NR==2{print $1}')" /bin/bash
}

#  misc

#  show a random quote
#  uses a file from my personal git repo ~/personal
quote () {
  QUOTES="$HOME/personal/lists/quotes_snippets.md"
  NUM_LINES=$(wc -l $QUOTES | awk '{print $1}')
  LINE=$((1 + RANDOM % $NUM_LINES))
  echo $(sed -n ${LINE}p ${QUOTES})
 }
