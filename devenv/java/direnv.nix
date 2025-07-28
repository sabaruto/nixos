{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  languages.java = {
    enable = true;
    maven.enable = true;
    jdk.package = pkgs.temurin-bin-24;
  };
  env = {
    JDTLS_HOME = "${pkgs.jdt-language-server}";
  };

  packages = with pkgs; [
    jdt-language-server
  ];
}
