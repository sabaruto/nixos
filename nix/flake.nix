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
      peripherals = ./modules/peripherals;
      system = ./modules/system;
      fun = ./modules/fun;

      lanzaboote-config = {
        imports = [ ./modules/lanzaboote lanzaboote.nixosModules.lanzaboote ];
      };

      secrets = {
        nixpkgs.overlays = [ opnix.overlays.default ];
        imports = [ ./modules/secrets opnix.nixosModules.default ];
      };

      default = {
        imports = [ system fun peripherals secrets lanzaboote-config ];
      };
    };

    homeManagerModules = rec {
      default = {
        imports = [
          home-manager.nixosModules.home-manager
          ./modules/base/home-manager.nix
        ];
      };

      apps = ./modules/apps;
      base = ./modules/base/home-manager.nix;
      cmd = ./modules/cmd;
      cron = ./modules/cron;
      dotfiles = ./modules/dotfiles;
      shells = ./modules/shells;
      secrets = {
        imports = [
          opnix.homeManagerModules.default
          ./modules/secrets/home-manager.nix
        ];
      };
      desktop-themes = ./modules/desktop-themes;

      all = {
        imports = [ apps cmd cron dotfiles shells secrets desktop-themes ];
      };
    };
  };
}
