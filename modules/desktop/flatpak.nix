{ config, pkgs, ... }:

let env = import ../../env.nix; in
{
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wants = [ "network-online.target" ];
    after = [ "network-online.target" "NetworkManager-wait-online.service" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
