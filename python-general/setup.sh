NAME=general
VERSION=3.10.6
pyenv install $VERSION -y
pip install --upgrade pip
pip install poetry -U
poetry install
pyenv virtualenv $VERSION $NAME
echo $NAME > ~/.python-version
