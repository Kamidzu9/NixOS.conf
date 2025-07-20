
let
    inherit (builtins) readDir listToAttrs readFile attrNames;
in  
{
  imports = [ ./config/pywal16.nix ];
  programs.pywal16 = {
    enable = true;
    templates = {
      "custom-hyprland-colors.conf" = ''$background = rgb({background.strip})
$background_alpha = {background.strip}
$foreground = rgb({foreground.strip})
$foreground_alpha = {foreground.strip}
$cursor = rgb({cursor.strip})
$cursor_alpha = {cursor.strip}
$color0 = rgb({color0.strip})
$color0_alpha = {color0.strip}
$color1 = rgb({color1.strip})
$color1_alpha = {color1.strip}
$color2 = rgb({color2.strip})
$color2_alpha = {color2.strip}
$color3 = rgb({color3.strip})
$color3_alpha = {color3.strip}
$color4 = rgb({color4.strip})
$color4_alpha = {color4.strip}
$color5 = rgb({color5.strip})
$color5_alpha = {color5.strip}
$color6 = rgb({color6.strip})
$color6_alpha = {color6.strip}
$color7 = rgb({color7.strip})
$color7_alpha = {color7.strip}
$color8 = rgb({color8.strip})
$color8_alpha = {color8.strip}
$color9 = rgb({color9.strip})
$color9_alpha = {color9.strip}
$color10 = rgb({color10.strip})
$color10_alpha = {color10.strip}
$color11 = rgb({color11.strip})
$color11_alpha = {color11.strip}
$color12 = rgb({color12.strip})
$color12_alpha = {color12.strip}
$color13 = rgb({color13.strip})
$color13_alpha = {color13.strip}
$color14 = rgb({color14.strip})
$color14_alpha = {color14.strip}
$color15 = rgb({color15.strip})
$color15_alpha = {color15.strip}''
    };
  }
}