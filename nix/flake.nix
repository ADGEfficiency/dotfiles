{
  description = "Adam Green's development environment.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        defaultPackage = with pkgs; buildEnv {
          name = "shell";
          paths = [
            actionlint
            go-tools
            bash
            bat
            beautysh
            cargo
            cbfmt
            cbonsai
            checkmake
            cmakeMinimal
            codespell
            direnv
            dpkg
            efm-langserver
            entr
            findutils
            fish
            flyctl
            gh
            git
            gnugrep
            gnumake
            gnused
            go
            gtk4
            hack-font
            hadolint
            htop
            httpie
            inetutils
            jq
            just
            lazydocker
            lazygit
            llvm
            locale
            lsd
            lua
            marksman
            neovim
            nerdfonts
            nodePackages_latest.markdownlint-cli
            nodePackages_latest.prettier
            nodePackages_latest.sql-formatter
            nodePackages_latest.stylelint
            nodejs_18
            ov
            pandoc
            python311
            ripgrep
            ruby
            shellcheck
            shellharden
            shunit2
            starship
            stow
            stylua
            # texlive.combined.scheme-tetex
            tig
            tmux
            tree
            tree
            unzip
            wget
            # yamlfix
            zig
            zip
            zoxide
            zsh
          ];
        };
      }
    );
}
