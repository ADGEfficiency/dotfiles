# nix-channel --add https://nixos.org/channels/nixpkgs-23.05-darwin
{ pkgs ? import <nixpkgs-23.05-darwin> { } }:

pkgs.stdenv.mkDerivation
{
  name = "mac-nix-env";
  unpackPhase = "true";
  buildCommand = "mkdir -p $out";
  buildInputs = with pkgs; [
    #  shell stuff
    atuin
    bat
    direnv
    exa
    fzf
    gh
    gnugrep
    gnumake
    gnused
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
    #  programming things
    flyctl
    git
    hack-font
    neovim
    nodejs_18
    python310
    ruby
    vimPlugins.packer-nvim
    #  macos specific - used in /etc/zshrc
    locale
  ];
}

