{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Essentials
    coreutils
    findutils
    wget
    git
    jq
    dconf
    xdg-utils
    direnv
    nix-direnv

    # Editors & IDEs
    vscode
    libreoffice
    gimp
    krita
    mc
    btop

    # Audio & Video
    pavucontrol
    pamixer
    obs-studio
    wlr-randr

    # Development tools
    gcc
    lua-language-server
    pyright
    prettierd
    black
    stylua
    nixfmt-rfc-style
    tree-sitter
    nodejs_24
    nodePackages.markdownlint-cli
    nodePackages.prettier
    # rustc
    # cargo
    # rustfmt

    # Qt & KDE
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    adwaita-qt
    adwaita-icon-theme
    catppuccin-gtk
    kdePackages.kdenlive
    kdePackages.kdeconnect-kde

    # Misc
    chafa
    gh
    ayugram-desktop
    google-chrome
    subversion

    # Games & Launchers
    (prismlauncher.override {
      additionalPrograms = [ ffmpeg ];
      jdks = [
        graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })
  ];
}
