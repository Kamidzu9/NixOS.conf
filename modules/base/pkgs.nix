{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- Essentials ---
    coreutils
    findutils
    wget
    git
    jq
    dconf
    xdg-utils
    direnv
    nix-direnv
    tree-sitter

    # --- Development ---
    gcc
    lua-language-server
    pyright
    prettierd
    black
    nodePackages.markdownlint-cli
    nodePackages.prettier
    stylua
    nixfmt-rfc-style

    # --- Editors & IDEs ---
    vscode
    libreoffice
    gimp
    krita
    mc
    btop

    # --- Audio & Video ---
    pavucontrol
    pamixer
    obs-studio

    # --- KDE/Qt ---
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    kdePackages.kdenlive
    kdePackages.kdeconnect-kde
    adwaita-qt
    adwaita-icon-theme
    catppuccin-gtk

    # --- Browsers ---
    google-chrome

    # --- Misc ---
    gh
    chafa
    fzf
    ayugram-desktop
    subversion
    wlr-randr

    # --- Node.js ---
    nodejs_24

    # --- Minecraft Launcher ---
    (prismlauncher.override {
      additionalPrograms = [ ffmpeg ];
      jdks = [
        graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })

    # --- Rust (commented out) ---
    # rustc
    # cargo
    # rustfmt
  ];
}
