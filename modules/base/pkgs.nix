{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    catppuccin-gtk
    ayugram-desktop
    krita
    kdePackages.kdenlive
    kdePackages.kdeconnect-kde
    subversion
    dconf
    jq
    vscode
    wget
    git
    adwaita-qt
    adwaita-icon-theme
    google-chrome
    nodejs_24
    coreutils
    findutils
    libreoffice
    mc
    btop
    pamixer
    gimp
    gcc
    lua-language-server
    pyright
    prettierd
    black
    nodePackages.markdownlint-cli
    obs-studio
    tree-sitter
    stylua
    nixfmt-rfc-style
    nodePackages.prettier
    wlr-randr
    # rustc
    # cargo
    # rustfmt
    direnv
    nix-direnv
    xdg-utils
    (prismlauncher.override {
      # Add binary required by some mod
      additionalPrograms = [ ffmpeg ];

      # Change Java runtimes available to Prism Launcher
      jdks = [
        graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })
  ];
}
