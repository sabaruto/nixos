{ pkgs }:
with pkgs;
mkShell {
  packages = [
    # java
    jdk24

    maven

    postgresql

    python3Full
  ];
}
