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
  cbfmt
  checkmake
  direnv
  efm-langserver
  exa
  flyctl
  fzf
  gh
  hack-font
  hadolint
  htop
  lazydocker
  lazygit
  neovim
  nodePackages_latest.markdownlint-cli
  shellcheck
  starship
  stylua
  tmux
  tree
  vimPlugins.packer-nvim
  zoxide
]
