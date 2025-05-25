{ lib, config, pkgs, inputs, ... }:
let path = "${config.home.homeDirectory}/nixos/pcs/halu/dotfiles";
in {
  imports = [
    inputs.local-nixos.nixosModules.shells
    inputs.local-nixos.nixosModules.system
    inputs.local-nixos.nixosModules.lib
    inputs.local-home-manager.nixosModules.default
  ];

  localModules = {
    name = "t-aaronobelley";
    hostname = "halu";
    stateVersion = "24.11";

    shells.zsh.enable = true;

    home-manager = {
      enable = true;
      modules = [ inputs.local-home-manager.nixosModules.all ];

      packages = with pkgs; [
        kubectl
        kind
        ctlptl
        helm
        tilt
        postman
        dconf-editor
        gnome-menus
        inputs.local-packages.packages."x86_64-linux".kulala-ls
      ];

      # TODO: Add to modules
      # home-file = {
      #   ".composer".source =
      #     config.lib.file.mkOutOfStoreSymlink "${path}/.composer";
      #   ".wezterm".source =
      #     config.lib.file.mkOutOfStoreSymlink "${path}/.wezterm";
      # };

      config = {
        cmd = {
          direnv.enable = true;
          oh-my-posh.enable = true;
        };

        apps = {
          neovim.enable = true;
          tmux.enable = true;

          git = {
            enable = true;
            user = "teya";
          };
        };

      };

    };
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

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ python3Full jdk24 ];
  };

  users = { defaultUserShell = pkgs.zsh; };

}
