
test:
  . ./nix/load-{{os()}}.sh && bash ./tests/*.sh

# nix/load-{{os()}}.sh handle the different way to load nix
# into a shell - different in macos & linux

nix-install:
	curl -L https://nixos.org/nix/install | sh

add_nix_channel := "nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable"
update_nix_channel := "nix-channel --update"
nix-channel:
  . ./nix/load-{{os()}}.sh && {{add_nix_channel}}
  . ./nix/load-{{os()}}.sh && {{update_nix_channel}}

install_cmd := "nix-env -i -f ./nix/default.nix"
nix-default-env:
  . ./nix/load-{{os()}}.sh && {{install_cmd}}

nix: nix-install nix-channel nix-default-env
