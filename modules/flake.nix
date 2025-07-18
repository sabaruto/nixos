{
  description = "Personal Modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { home-manager, lanzaboote, ... }:
    {

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

        apps = ./apps;
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
    };
}
