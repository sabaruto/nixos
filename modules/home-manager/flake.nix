{
  description = "General Home Manager modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosModules = rec {
      default = {
        imports = [ inputs.home-manager.nixosModules.home-manager ./base.nix ];
      };

      apps = ./apps;
      base = ./base;
      cmd = ./cmd;
      cron = ./cron;
      shells = ./shells;
      desktop-themes = ./desktop-themes;

      all = { imports = [ apps base cmd cron shells desktop-themes ]; };
    };
  };
}
