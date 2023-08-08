{ pkgs ? import <nixpkgs> { } }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in
with pkgs; [
  atuin
  bat
  direnv
  exa
  flyctl
  fzf
  gh
  git
  gnugrep
  gnumake
  gnused
  hack-font
  jq
  just
  lazydocker
  lazygit
  neovim
  nodejs_18
  ripgrep
  ruby
  shunit2
  starship
  tmux
  toybox
  tree
  vimPlugins.packer-nvim
  zoxide
  zsh
  zsh-prezto
]
++ lib.optionals isLinux [ python310 ]
++ lib.optionals isDarwin [ locale ]
