{ lib, ...}:

let
  homeDir = "/home/mischa";
  mcSkinsDir = "${homeDir}/.local/share/mc/skins";
  catppuccinIni = builtins.readFile ../.config/mc/mc.ini;
in
{
  home.activation.symlinkCatppuccin = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ${mcSkinsDir}
    echo "${catppuccinIni}" > ${mcSkinsDir}/catppuccin.ini
  '';

  home.file.".config/mc/ini".text = ''
    [Midnight-Commander]
    skin=catppuccin
  '';
}

