let 
    inherit (builtins) replaceStrings concatStringsSep mapAttrs attrValues;
    waybarToStr = f: concatStringsSep "\n"
        (attrValues (mapAttrs (key: value: "${replaceStrings ["-"] ["_"] key} ${toString value}") f));
in
{
  programs.kitty = {
    enable = true;
    extraConfig = waybarToStr {
      font-family = "FiraCode Nerd Font";
      font-size = 16;
      enable-audio-bell = "no";
      background-opacity = 0.85;
      background-blur = 1;
      cursor-trail = 3;
      cursor-trail-decay = "0.1 0.4";
      cursor-shape = "block";
      include = "$HOME/.cache/wal/colors-kitty.conf";
    };
  };
}
