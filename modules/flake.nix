{
  description = "Personal Modules";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs = {
        rust-overlay.follows = "rust-overlay";
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      home-manager,
      lanzaboote,
      flake-utils,
      zen-browser,
      ...
    }:
    flake-utils.lib.eachDefaultSystemPassThrough (system: {

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
            zen-browser.homeModules.twilight
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
