{ ... }: {
  imports = [ ../base.nix ];

  config.localModules.home-manager.paths = [ ./apps ./base ./cmd ./cron ./lib ];
}
