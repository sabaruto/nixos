{
  description = "General NixOS modules";

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
  };

  outputs = { opnix, lanzaboote, ... }: {

    nixosModules = rec {
      peripherals = ./peripherals;
      system = ./system;
      fun = ./fun;

      lanzaboote-config = {
        imports = [ ./lanzaboote lanzaboote.nixosModules.lanzaboote ];
      };

      secrets = { imports = [ ./secrets opnix.nixosModules.default ]; };

      default = {
        imports = [ system fun peripherals secrets lanzaboote-config ];
      };
    };
  };
}
