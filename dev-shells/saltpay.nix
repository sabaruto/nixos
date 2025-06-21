{ pkgs }:
with pkgs;
mkShell {
  packages = [
    # java
    jdk24

    maven
    spring-boot-cli
    lombok
    libglibutil
    jdt-language-server
    teleport

    postgresql

    python3Full
  ];
}
