{ pkgs ? import <nixpkgs> { } }:

let
  isDarwin = pkgs.stdenv.isDarwin;
in
with pkgs; [
  # Shell stuff
  atuin
  bat
  direnv
  exa
  fzf
  gh
  gnugrep
  gnumake
  gnused
  just
  jq
  lazydocker
  lazygit
  ripgrep
  shunit2
  starship
  tmux
  toybox
  tree
  zoxide
  zsh
  zsh-prezto
  # Programming things
  flyctl
  git
  hack-font
  neovim
  nodejs_18
  python310
  ruby
  vimPlugins.packer-nvim
]
++ lib.optionals isDarwin [ locale ] # Add macOS-specific packages conditionally
