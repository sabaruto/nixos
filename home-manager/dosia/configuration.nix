{ config, ... }:
{
  users.users.dosia = {
    isNormalUser = true;
    description = "Theodosia Kalu";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}