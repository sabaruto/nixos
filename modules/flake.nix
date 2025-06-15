{
  description = "Personal Modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    opnix = {
      url = "github:brizzbuzz/opnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, opnix, lanzaboote, ... }: {

    nixosModules = rec {
      peripherals = ./peripherals;
      system = ./system;
      fun = ./fun;

      lanzaboote-config = {
        imports = [ ./lanzaboote lanzaboote.nixosModules.lanzaboote ];
      };

      secrets = {
        nixpkgs.overlays = [ opnix.overlays.default ];
        imports = [ ./secrets opnix.nixosModules.default ];
      };

      default = {
        imports = [ system fun peripherals secrets lanzaboote-config ];
      };
    };

    homeManagerModules = rec {
      default = {
        imports = [ home-manager.nixosModules.home-manager ./base ];
      };

      apps = ./apps;
      base = ./base;
      cmd = ./cmd;
      cron = ./cron;
      dotfiles = ./dotfiles;
      shells = ./shells;
      secrets = {
        imports =
          [ opnix.homeManagerModules.default ./secrets/home-manager.nix ];
      };
      desktop-themes = ./desktop-themes;

      all = {
        imports = [ apps cmd cron dotfiles shells secrets desktop-themes ];
      };
    };
  };
}
