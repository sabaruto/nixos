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

    dotfiles.kde.enable = true;
    peripherals.kanata.enable = true;

    home-manager = {
      enable = true;
      modules = [ inputs.local-home-manager.nixosModules.all ];

      packages = with pkgs; [
        # zoom
        zoom-us

        chezmoi

        oh-my-zsh
        oh-my-posh

        # fonts
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
        nerd-fonts.martian-mono
      ];

      config = {
        # shells.zsh.enable = true;

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
