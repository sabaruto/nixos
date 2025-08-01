{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules;
in
{
  imports = [
    ./zsh
    ./fish
  ];
  config = {
    home.packages = with pkgs; [ oh-my-posh ];

    localModules.shells = mkIf cfg.development.enable {
      zsh.enable = true;
    };

    home.shellAliases = mkMerge [
      {
        n-switch = "nixos-rebuild switch --sudo";
        n-debug = "nixos-rebuild switch --sudo --show-trace --verbose";
        n-up = "nix flake update";
      }

      (mkIf (config.home.username == "t-aaronobelley") {
        # Installation environment
        mvn-install = "./mvnw install -Dskip.unitTests -Dskip.integrationTests=true -Djacoco.skip=true -Dcheckstyle.skip=true";
        mvn-clean-install = "./mvnw clean install -Dskip.unitTests -Dskip.integrationTests=true -Dcheckstyle.skip=true";
        mvn-full-install = "./mvnw clean install";

        idea = "~/.local/share/JetBrains/Toolbox/apps/intellij-idea-community-edition/bin/idea";
        # # ssh connecton
        # ssh-add = "ssh-add.exe";
        # ssh = "ssh.exe";
      })
    ];
  };
}
