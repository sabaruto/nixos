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
      dotfiles = ./default/dotfiles;
      peripherals = ./default/peripherals;
      shells = ./default/shells;
      system = ./default/system;
      fun = ./personal/fun;
      lib = ./default/lib;

      lanzaboote-config = {
        imports = [ ./personal/lanzaboote lanzaboote.nixosModules.lanzaboote ];
      };

      default = {
        imports =
          [ dotfiles lib shells system fun peripherals lanzaboote-config ];
      };
    };
  };
}
