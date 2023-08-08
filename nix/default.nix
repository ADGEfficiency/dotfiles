{ pkgs ? import <nixpkgs> { }, devShell ? false }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in
with pkgs; [
  git
  gnugrep
  gnumake
  gnused
  jq
  nodejs_18
  ripgrep
  shunit2
  toybox
  zsh
  zsh-prezto
]
++ lib.optionals isLinux [ python310 ]
++ lib.optionals isDarwin [
  cargo
  locale
  llvm
]
++ lib.optionals devShell [
  bat
  direnv
  exa
  flyctl
  htop
  fzf
  gh
  hack-font
  lazydocker
  lazygit
  neovim
  starship
  hadolint
  checkmake
  shellcheck
  tmux
  cbfmt
  stylua
  efm-langserver
  nodePackages_latest.markdownlint-cli
  tree
  vimPlugins.packer-nvim
  zoxide
]
