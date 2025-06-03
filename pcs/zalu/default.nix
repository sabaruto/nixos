{ inputs, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.local-nixos.nixosModules.default
    inputs.local-home-manager.nixosModules.default
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  localModules = {
    name = "dosia";
    hostname = "zalu";
    stateVersion = "24.11";

    swapSize = 16 * 1024;
    gpu = "none";

    desktopEnvironment = "gnome";

    apps = { steam.enable = true; };
    peripherals.kanata.enable = true;
    virtualisation.docker.enable = true;

    home-manager = {
      enable = true;
      modules = [ inputs.local-home-manager.nixosModules.all ];

      config = {
        cmd = {
          direnv.enable = true;
          oh-my-posh.enable = true;
        };

        apps = {
          git.enable = true;
          neovim.enable = true;
          wezterm.enable = true;
        };

        development = {
          enable = true;
          installOnNixos = true;
          languages = [ "nix" "lua" "java" "golang" "typescript" ];
        };
      };
    };
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  hardware.bluetooth.enable = true;
}
