{
  appimageTools,
  pname,
  version,
  src,
}:

appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun'
  '';
}
