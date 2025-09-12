mkdir -p "$XDG_CONFIG_HOME"/fish/functions
git clone https://github.com/edc/bass "$XDG_CONFIG_HOME"/fish/functions/bass
cd "$XDG_CONFIG_HOME"/fish/functions/bass && make install
cp ~/.config/fish/functions/* "$XDG_CONFIG_HOME"/fish/functions/
rm -rf ~/.config/fish/functions/bass
