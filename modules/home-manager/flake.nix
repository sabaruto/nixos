{
  description = "General Home Manager modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    opnix.url = "github:brizzbuzz/opnix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, opnix, ... }: {
    nixosModules = rec {
      default = {
        imports = [ home-manager.nixosModules.home-manager ./base.nix ];
      };

      apps = ./apps;
      base = ./base;
      cmd = ./cmd;
      cron = ./cron;
      shells = ./shells;
      secrets = { imports = [ opnix.homeManagerModules.default ./secrets ]; };
      desktop-themes = ./desktop-themes;

      all = { imports = [ apps base cmd cron shells secrets desktop-themes ]; };
    };
  };
}
