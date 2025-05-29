{ pkgs }:
with pkgs;
mkShell {
  packages = [
    # java
    jdk24

    maven
    spring-boot-cli
    lombok

    postgresql

    python3Full
  ];
}
