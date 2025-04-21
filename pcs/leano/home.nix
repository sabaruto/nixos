{ ... }:
{
  localModules = {
    cronjobs.theme-switching.enable = true;

    dotfiles = {
      waybar.enable = true;

      hyprland = {
        enable = true;
        monitors = "alienware";
      };
    };
  };
}
