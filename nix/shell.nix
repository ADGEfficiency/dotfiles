{ system ? builtins.currentSystem }:

let
  packageList = import ./packages.nix;
in
stdenv.mkDerivation
{
  name = "my-environment";
  buildInputs = packageList;
}

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
