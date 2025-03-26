{ ... }: {
  localModules = {
    environments.ssm.enable = true;

    development = {
      enable = true;
      languages = [ "nix" ];
    };
  };
}
