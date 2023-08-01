{
  pkgs ? import <nixpkgs> {}
}:

pkgs.mkShell {
  name = "macos";
  buildInputs = [
    pkgs.which
     pkgs.git
     pkgs.neovim
     pkgs.zsh
     pkgs.starship
  ];
}
