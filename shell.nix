# nix-channel --add https://nixos.org/channels/nixpkgs-23.05-darwin
{ pkgs ? import <nixpkgs-23.05-darwin> { } }:

pkgs.mkShell
{
  name = "mac-nix";
  buildInputs = [
    pkgs.git
    pkgs.neovim
    pkgs.starship
    pkgs.which
    pkgs.zsh
    pkgs.vimPlugins.packer-nvim
  ];

  shellHook = ''
    export SHELL=/bin/zsh
    # nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  '';
}
