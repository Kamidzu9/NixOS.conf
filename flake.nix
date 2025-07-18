{
  description = "Ryan Yin's nix configuration for both NixOS & macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    
    # Catppuccin theme
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add more inputs as needed
  };

  outputs = inputs: import ./outputs.nix inputs;
}
