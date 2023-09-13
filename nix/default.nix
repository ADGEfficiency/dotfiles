{ pkgs ? import <nixpkgs> { }, devShell ? false }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in
with pkgs; [
  # curlWithGnuTls
  git
  gnugrep
  gnumake
  findutils
  gnused
  jq
  nodejs_18
  ripgrep
  shunit2
  tree
  wget
  dpkg
  # toybox
  unzip
  zip
  zsh
  inetutils
]
++ lib.optionals isLinux [ python310 ]
++ lib.optionals isDarwin [
  cargo
  locale
  llvm
  cmakeMinimal
  gtk4
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
  nerdfonts
  pandoc
  texlive.combined.scheme-tetex
  # hadolint
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
