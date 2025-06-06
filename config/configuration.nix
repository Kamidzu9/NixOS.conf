{ pkgs, ... }:

let
  env = import ./env.nix;
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
  };
in
{
  imports = [
    ./hardware-configuration.nix

    # System modules
    ../modules/system/bluetooth.nix
    ../modules/system/chkrootkit.nix
    ../modules/system/fileSystems.nix
    ../modules/system/firewall.nix
    ../modules/system/fonts.nix
    ../modules/system/journald.nix
    ../modules/system/localization.nix
    ../modules/system/nix-settings.nix
    ../modules/system/packages.nix
    ../modules/system/security.nix
    ../modules/system/ssh.nix
    ../modules/system/updates.nix
    ../modules/cli/zsh.nix
    ../modules/system/users.nix

    # Desktop/System:
    ../modules/desktop/flatpak.nix
    ../modules/desktop/input.nix
    ../modules/desktop/hyprland/system.nix
    ../modules/desktop/pipewire.nix

    # Desktop-Services
    ../modules/desktop/services/auto-cpufreq.nix
    ../modules/desktop/services/tlp.nix
    ../modules/desktop/services/docker.nix

    # Home-Manager
    (import "${home-manager}/nixos")
  ];

  home-manager.users.mischa = import ../home/home.nix;

  system.stateVersion = "25.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  security.pam.services.swaylock = { };

  xdg.mime.enable = true;

  networking.hostName = env.myHostname;
  networking.networkmanager.enable = true;
  services.dbus.enable = true;

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
