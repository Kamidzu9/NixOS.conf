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
    ../modules/system/firewall.nix
    ../modules/system/ssh.nix
    ../modules/system/security.nix
    ../modules/system/updates.nix
    ../modules/system/nix-settings.nix
    ../modules/system/journald.nix
    ../modules/system/users.nix
    ../modules/system/packages.nix
    ../modules/system/fonts.nix

    ../modules/desktop/hyprland.nix
    ../modules/desktop/zsh.nix
    ../modules/desktop/flatpak.nix
    ../modules/desktop/docker.nix
    ../modules/desktop/auto-cpufreq.nix
    ../modules/desktop/pipewire.nix
    ../modules/desktop/input.nix

    (import "${home-manager}/nixos")
  ];

  home-manager.users.mischa = import ../home/home.nix;

  system.stateVersion = "25.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = env.myHostname;
  networking.networkmanager.enable = true;
  services.dbus.enable = true;

  # Sudo hart
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = true;

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}

