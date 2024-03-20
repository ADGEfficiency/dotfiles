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
  stow
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
++ lib.optionals isLinux [ python311 ]
++ lib.optionals isDarwin [
  cargo
  locale
  llvm
  cmakeMinimal
  gtk4
  python311
]
++ lib.optionals devShell [
  bat
  #cbfmt
  checkmake
  direnv
  efm-langserver
  exa
  flyctl
  just
  entr
  #fzf
  gh
  go
  lsd
  httpie
  hack-font
  nerdfonts
  pandoc
  texlive.combined.scheme-tetex
  beautysh
  #hadolint
  htop
  tig
  ov
  lazydocker
  lazygit
  neovim
  codespell
  shellharden
  nodePackages_latest.markdownlint-cli
  nodePackages_latest.prettier
  nodePackages_latest.sql-formatter
  nodePackages_latest.stylelint
  #yamlfix
  shellcheck
  starship
  stylua
  tmux
  tree
  vimPlugins.packer-nvim
  zoxide
  ruby
  lua
  actionlint
  zig
  cbonsai
]
