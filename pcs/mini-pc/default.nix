{ config, pkgs, home-manager-modules, ... }: {
  imports = [ ./hardware-configuration.nix ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.nix-ld.enable = true;
  virtualisation.docker.enable = true;

  programs.ssh.startAgent = true;
  networking.firewall.allowedTCPPorts = [ 8384 ];

  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
      dataDir = "/data/jellyfin";
    };

    plex.enable = true;
    nzbget.enable = true;

    sonarr = {
      enable = true;

      settings = { server = { urlbase = "sonarr"; }; };
    };

    radarr = {
      enable = true;

      settings = { server = { urlbase = "radarr"; }; };
    };
    readarr = {
      enable = true;

      settings = { server = { urlbase = "readarr"; }; };
    };
    lidarr = {
      enable = true;

      settings = { server = { urlbase = "lidarr"; }; };
    };

    prowlarr = {
      enable = true;

      settings = { server = { urlbase = "prowlarr"; }; };
    };

    rtorrent = {
      enable = true;
      openFirewall = true;

      group = "servarr";
    };

    rutorrent = {
      enable = true;

      hostName = "localhost";
      group = "servarr";
    };

    deluge = {
      enable = true;
      group = "servarr";

      web = {
        enable = true;
        openFirewall = true;
      };
    };

    flaresolverr = {
      enable = true;
      openFirewall = true;
    };

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
      rtorrent = {
        isSystemUser = true;
        group = "servarr";
      };

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
          "root"
          "lidarr"
          "sonarr"
          "radarr"
          "prowlarr"
          "nzbget"
          "plex"
          "jellyfin"
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
        localModules = {

          cmd = {
            direnv.enable = true;
            oh-my-posh.enable = true;
          };

          shells.zsh.enable = true;

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
