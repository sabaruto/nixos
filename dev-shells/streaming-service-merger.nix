{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    zsh

    # Java
    jdk21

    # Build Automation
    maven

    # Database
    sqlite
  ];
}
