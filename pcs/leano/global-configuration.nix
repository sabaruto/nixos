{ ... }: {
  localModules = {
    development = {
      enable = true;
      languages = [ "nix" ];
    };
    environments.ssm.enable = true;
  };
}
