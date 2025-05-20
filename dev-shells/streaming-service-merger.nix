{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    zsh

    # Build Automation
    maven

    # Database
    sqlite
  ];
}
