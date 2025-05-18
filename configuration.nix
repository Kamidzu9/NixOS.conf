# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  env = import ./env.nix;
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  home-manager.users.mischa = import ./home.nix;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-${env.myLuksUUID}".device = "/dev/disk/by-uuid/${env.myLuksUUID}";

  networking.hostName = env.myHostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  programs.hyprland.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch";
    };
  };

  #######################
  # Auto CPUFreq Setup  #
  #######################
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = env.battGov;
        turbo    = env.battTurbo;
      };
      charger = {
        governor = env.acGov;
        turbo    = env.acTurbo;
      };
    };
  };

  #######################
  # TLP Power‑Tuning    #
  #######################
  services.tlp = {
    enable   = true;
    settings = {
      # CPU governor (will align with auto‑cpufreq when both are active)
      CPU_SCALING_GOVERNOR_ON_AC  = env.acGov;
      CPU_SCALING_GOVERNOR_ON_BAT = env.battGov;

      # Intel energy‑performance bias (0=power, 2=balance_performance, 5=balance_power, 7=performance)
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC  = "performance";

      # Hard caps on performance %
      CPU_MIN_PERF_ON_AC  = 0;
      CPU_MAX_PERF_ON_AC  = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      # USB autosuspend
      USB_AUTOSUSPEND = 1;

      # PCIe ASPM (aggressive power saving)
      PCIE_ASPM_ON_AC  = "powersave";
      PCIE_ASPM_ON_BAT = "powersave";

      # Battery charge thresholds (Lenovo‑style)
      START_CHARGE_THRESH_BAT0 = 60;
      STOP_CHARGE_THRESH_BAT0  = 80;
    };
  };


  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  services.libinput.enable = true;

  services.libinput.touchpad = {
    tapping = true;
    naturalScrolling = true;
    clickMethod = "clickfinger"; # як на macOS
    disableWhileTyping = true;
    scrollMethod = "twofinger";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${env.myUser} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = env.myFullName;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    kitty
    zsh
    wofi
    curl
    cmake
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
