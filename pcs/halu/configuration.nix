{ lib, pkgs, outputs, ... }: {
  imports = [ outputs.nixosModules.default outputs.nixosModules.work ];
  localModules = {
    name = "t-aaronobelley";
    hostname = "halu";
    stateVersion = "24.11";

    shells.zsh.enable = true;

    lib.op-inject = [
      {
        templatePath =
          "/home/t-aaronobelley/nixos/pcs/halu/dotfiles/.composer/config.json.tpl";
        outputPath = "/home/t-aaronobelley/.composer/config.json";

      }
      {
        templatePath =
          "/home/t-aaronobelley/nixos/pcs/halu/dotfiles/.m2/settings.xml.tpl";
        outputPath = "/home/t-aaronobelley/.m2/settings.xml";
      }
    ];
  };

  wsl = {
    enable = true;
    defaultUser = "t-aaronobelley";

    # USB access
    usbip.enable = true;
    useWindowsDriver = true;
    startMenuLaunchers = true;
    docker-desktop.enable = true;
  };

  programs.nix-ld.enable = true;

  users = { defaultUserShell = pkgs.zsh; };
}
