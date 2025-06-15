# NixOS.conf

**Author:** Kamidzu9

## Description

Minimalistic Cattpuccino NixOS configuration with Home Manager and Hyprland.

## Features

- **DE/WM:** Hyprland
- **Shell:** zsh
- **Editor:** nixvim with plugins
- **Prompt:** starship
- **Apps:** swaync, swaylock, waybar, prismlauncher, clipse (copy/paste manager), rofi
- **Languages/Environments:** Node.js, Python, Rust, Docker
- Preconfigured NixOS security
- Preinstalled packages for Node.js, Python, and Rust development
- nixvim configuration with popular plugins

## Screenshots

![Hyprland Workspace](./assets/hyprland_workspace.png)
![nixvim in action](./assets/nixvim.png)
![Midnight Commander](./assets/mc.png)

## Installation Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/Kamidzu9/NixOS.conf.git
   cd NixOS.conf
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

3. Reboot and type Hyprland in CLI

## Usage

- Adjust the package list in `configuration.nix` as needed.
- To add new plugins to nixvim, edit `./home/modules/neovim/default.nix`.

## Resources

- [NixOS Handbook](https://nixos.org/manual/nixos/stable/)
- [Home Manager](https://github.com/nix-community/home-manager)
