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
      inherit (inputs) nixd;

      default = {
        imports = [ inputs.home-manager.nixosModules.home-manager ./base.nix ];
      };

      apps = ./default/apps;

      cmd = ./default/cmd;

      cron = ./default/cron;

      all = { imports = [ apps cmd cron ]; };
    };
  };
}
