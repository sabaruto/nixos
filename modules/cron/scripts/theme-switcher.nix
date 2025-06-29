{ pkgs, conf-path, }:

pkgs.writeShellScriptBin "switch-theme" ''
  mode=$1
  conf=""

  if [[ $mode == "light" ]]; then
    conf=${conf-path}/light.gsettings
  else
    conf=${conf-path}/dark.gsettings
  fi

  ${pkgs.coreutils}/bin/cp $conf ~/.local/share/nwg-look/gsettings
  ${pkgs.nwg-look}/bin/nwg-look -a
''
