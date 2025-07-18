# TODO: Create a packages flake
{ pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem
, nodejs ? pkgs."nodejs_24" }:

let
  nodeEnv = import ./node-env.nix {
    inherit (pkgs) stdenv lib python2 runCommand writeTextFile writeShellScript;
    inherit pkgs nodejs;
    libtool = if pkgs.stdenv.isDarwin then
      pkgs.cctools or pkgs.darwin.cctools
    else
      null;
  };
in import ./node-packages.nix {
  inherit (pkgs) fetchurl;
  inherit nodeEnv;
}
