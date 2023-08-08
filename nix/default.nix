{ pkgs ? import <nixpkgs> { }, devShell ? false }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in
with pkgs; [
  bat
  git
  gnugrep
  gnumake
  gnused
  jq
  just
  nodejs_18
  ripgrep
  shunit2
  toybox
  tree
  zsh
  zsh-prezto
]
++ lib.optionals isLinux [ python310 ]
++ lib.optionals isDarwin [ locale ]
++ lib.optionals devShell [
  direnv
  exa
  flyctl
  fzf
  gh
  hack-font
  lazydocker
  lazygit
  locale
  neovim
  starship
  tmux
  vimPlugins.packer-nvim
  zoxide
]
