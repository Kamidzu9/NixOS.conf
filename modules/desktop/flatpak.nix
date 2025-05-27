{ config, pkgs, ... }:

let env = import ../../env.nix; in
{
  systemd.services.flatpak-repo = {
    description = "Add Flathub Flatpak Repo";
    wants = [ "network-online.target" ];
    after = [ "network-online.target" "NetworkManager.service" "NetworkManager-wait-online.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    path = [ pkgs.flatpak ];
    script = ''
      echo "Adding Flathub remote if not exists..."
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
