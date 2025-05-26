{
  # Nix-Build-Sandbox + Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.build-use-sandbox = true;
}
