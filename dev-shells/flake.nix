{
  description = "Dev shells flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystemPassThrough (system: {
      devShells."${system}" = {
        python = import ./python.nix { inherit nixpkgs system; };
        saltpay = import ./saltpay.nix { inherit nixpkgs system; };
        nodejs = import ./nodejs.nix { inherit nixpkgs system; };
        openaws-vpn-client = import ./openaws-vpn-client.nix { inherit nixpkgs system; };
        code-to-video = import ./code-to-video.nix { inherit nixpkgs system; };
      };
    });
}
