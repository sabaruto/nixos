{ config, pkgs, inputs, home-manager-modules, ... }: {
  imports = [ ./hardware-configuration.nix ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.nix-ld.enable = true;
  virtualisation.docker.enable = true;

  programs.ssh.startAgent = true;

  services = {
    jellyfin.enable = true;
    plex.enable = true;
    nzbget.enable = true;
    sonarr.enable = true;
    radarr.enable = true;
    lidarr.enable = true;
    prowlarr.enable = true;
    music-assistant = {
      enable = true;
      providers = [ "tidal" "spotify" "filesystem_local" "jellyfin" ];
    };

    tailscale = {
      openFirewall = true;
      useRoutingFeatures = "both";
      authKeyFile = "/home/${config.localModules.name}/etc/auth/tailscale_key";
    };
  };

  environment.systemPackages = with pkgs; [
    jellyfin-web
    jellyfin-ffmpeg

    qbittorrent
    qbittorrent-nox
    qbittorrent-cli
  ];

  users = {
    users = {
      sonarr = { uid = 274; };

      radarr = { uid = 275; };

      lidarr = { uid = 306; };

      mstream = {
        uid = 307;
        group = "servarr";
      };
    };

    groups = {
      servarr = {
        gid = 1001;

        members = [
          "lidarr"
          "sonarr"
          "radarr"
          "prowlarr"
          "nzbget"
          "plex"
          "music-assistant"
          config.localModules.name
        ];
      };
    };
  };

  localModules = {
    name = "saiki";
    hostname = "mini-pc";
    stateVersion = "25.11";

    desktopEnvironment = "none";

    swapSize = 8 * 1024;
    gpu = "none";

    home-manager = {
      enable = true;
      username = config.localModules.name;
      modules = home-manager-modules;

      packages = with pkgs; [
        docker
        docker-compose
        transmission_4
        rtorrent
        jellyfin
      ];

      config = {
        programs.onepassword-secrets = {
          enable = true;
          secrets = [{
            path = "etc/auth/tailscale_key";
            reference = "op://System/Mini PC Tailscale/auth-key";
          }];
        };

        localModules = {

          cmd.direnv.enable = true;

          apps = {
            neovim.enable = true;
            tmux.enable = true;
            git.enable = true;
          };

          development.enable = true;
        };
      };
    };
  };
}
