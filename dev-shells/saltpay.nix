{ pkgs }:
with pkgs;
mkShell {
  packages = [
    # java
    temurin-bin-24
    temurin-bin
    temurin-bin-17
    temurin-bin-11

    spring-boot-cli
    libglibutil
    teleport

    # project builders
    maven
    gradle

    # Jars
    lombok
    checkstyle

    # lsp
    jdt-language-server

    # Databases
    postgresql

    python3Full
  ];
}
