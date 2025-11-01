{
  description = "Personal Modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs = {
        rust-overlay.follows = "rust-overlay";
        nixpkgs.follows = "nixpkgs";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emanote = {
      url = "github:srid/emanote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      emanote,
      home-manager,
      lanzaboote,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystemPassThrough (system: {

      overlays = {
        default = _: _: {
          emanote = emanote.packages."${system}".default;
        };
      };

      nixosModules = rec {
        peripherals = ./peripherals;
        system = ./system;
        fun = ./fun;

        lanzaboote-config = {
          imports = [
            ./lanzaboote
            lanzaboote.nixosModules.lanzaboote
          ];
        };

        default = {
          imports = [
            system
            fun
            peripherals
            lanzaboote-config
          ];
        };
      };

      homeManagerModules = rec {
        default = {
          imports = [
            home-manager.nixosModules.home-manager
            ./base
          ];
        };

        apps = {
          imports = [
            emanote.homeManagerModule
            ./apps
          ];
        };
        base = ./base;
        cmd = ./cmd;
        lib = ./lib;
        cron = ./cron;
        dotfiles = ./dotfiles;
        shells = ./shells;
        desktop-themes = ./desktop-themes;

        all = {
          imports = [
            apps
            cmd
            lib
            cron
            dotfiles
            shells
            desktop-themes
          ];
        };
      };
    });
}
