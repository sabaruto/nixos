{
  description = "General NixOS modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { lanzaboote, ... }: {

    nixosModules = rec {
      peripherals = ./peripherals;
      system = ./system;
      fun = ./fun;

      lanzaboote-config = {
        imports = [ ./lanzaboote lanzaboote.nixosModules.lanzaboote ];
      };

      default = { imports = [ system fun peripherals lanzaboote-config ]; };
    };
  };
}
