{ config, ... }:
{
  programs.dconf.enable = true;
  users.users.dosia = {
    isNormalUser = true;
    description = "Theodosia Kalu";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
