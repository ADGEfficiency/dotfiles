# nix-channel --add https://nixos.org/channels/nixpkgs-23.05-darwin
{ pkgs ? import <nixpkgs-23.05-darwin> { } }:

pkgs.stdenv.mkDerivation
{
  name = "mac-nix-env";
  unpackPhase = "true";
  buildCommand = "mkdir -p $out";
  buildInputs = with pkgs; [
    #  basic shell stuff
    bat
    exa
    gnugrep
    gnumake
    gnused
    jq
    ripgrep
    toybox
    tree
    tmux
    lazydocker
    lazygit
    gh
    #  programming things
    hack-font
    flyctl
    git
    neovim
    nodejs_18
    python310
    ruby
    vimPlugins.packer-nvim
    #  shell / zsh things
    direnv
    fzf
    starship
    zoxide
    zsh
    zsh-prezto
    #  macos specific
    locale
    #  misc
    nb
  ];
}

