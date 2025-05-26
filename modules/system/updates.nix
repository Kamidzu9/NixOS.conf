{
  # Automatische System-Updates
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = null;
  };

  # Garbage-Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
