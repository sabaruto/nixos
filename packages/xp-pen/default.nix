{ pkgs ? import <nixpkgs> { inherit system; }
, system ? builtins.currentSystem
}:
import ./package.nix {
  inherit (pkgs) lib xorg stdenv autoPatchelfHook libusb1 libglvnd;
  inherit (pkgs.libsForQt5.qt5) qtbase wrapQtAppsHook;

}
