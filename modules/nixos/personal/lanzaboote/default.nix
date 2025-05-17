{ ... }: {
  boot = {
    loader.systemd-boot.enable = false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
