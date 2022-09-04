
#!

# should work on bash or zsh
gz() {
  vim $(grep -irl $1 $2 | fzf)
}

# change github remote - useful when changing to ssh
remote() {
  git remote set-url origin $1
}

make_env() {
  VERSION=$1
  NAME=$2
  pyenv virtualenv $VERSION $NAME
	echo $NAME > .python-version
}

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

tunnelk() {
  port=$1
  userhost=$2
  key=$3
  ssh -i $3 -N -L "localhost:${port}:localhost:${port}" $userhost
}

tunnelnk() {
  port=$1
  userhost=$2
  ssh -N -L "localhost:${port}:localhost:${port}" $userhost
}

#  some stuff needs to be done before powerlevel10k
quote () {
  QUOTES="$HOME/personal/lists/quotes_snippets.md"
  NUM_LINES=$(wc -l $QUOTES | awk '{print $1}')
  LINE=$((1 + RANDOM % $NUM_LINES))
  echo $(sed -n ${LINE}p ${QUOTES})
 }
