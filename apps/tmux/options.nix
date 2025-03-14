{ lib, ... }: {
  options.localModules.apps.tmux.enable = lib.mkEnableOption "tmux";
}
