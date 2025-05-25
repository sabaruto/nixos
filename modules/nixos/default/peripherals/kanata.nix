{ lib, config, ... }:
with lib;
let cfg = config.localModules.peripherals.kanata;
in {
  options.localModules.peripherals.kanata.enable = mkEnableOption "Kanata";

  config = mkIf cfg.enable {
    hardware.uinput.enable = true;

    services.kanata = {
      enable = true;

      keyboards = {
        "home-row" = {
          devices = [ ];
          config = ''
            (defsrc
              a   s   d   f   h   j   k   l
            )
            (defvar
              tap-time 200
              hold-time 200
            )
            (defalias
              a (tap-hold $tap-time $hold-time a lmet)
              s (tap-hold $tap-time $hold-time s lalt)
              d (tap-hold $tap-time $hold-time d lsft)
              f (tap-hold $tap-time $hold-time f lctl)
              h (tap-hold $tap-time $hold-time h rctl)
              j (tap-hold $tap-time $hold-time j rsft)
              k (tap-hold $tap-time $hold-time k ralt)
              l (tap-hold $tap-time $hold-time l rmet)
            )
            (deflayer base
              @a  @s  @d  @f  @h  @j  @k  @l
            )
          '';

          extraDefCfg = "process-unmapped-keys yes";
        };
      };
    };
  };
}
