{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    sqls
    zsh

    # Java
    jdk21

    # Build Automation
    maven
  ];
}
