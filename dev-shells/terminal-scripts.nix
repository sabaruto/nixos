{ pkgs }:
with pkgs;
mkShell { packages = with python313Packages; [ requests ]; }
