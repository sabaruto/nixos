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

      apps = ./default/apps;

      base = ./default/base;

      cmd = ./default/cmd;

      cron = ./default/cron;

      desktop-themes = ./default/desktop-themes;

      all = { imports = [ apps base cmd cron desktop-themes ]; };
    };
  };
}
