
[linux]
test:
  . ./nix/load-ubuntu.sh && bash ./tests/*.sh

[macos]
test:
  . ./nix/load-macos.sh && bash ./tests/*.sh


[macos]
nix:
