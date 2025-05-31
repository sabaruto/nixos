{ pkgs }: with pkgs; mkShell { packages = [ docker docker-compose ]; }
