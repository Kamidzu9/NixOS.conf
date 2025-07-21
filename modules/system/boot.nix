{ pkgs, ... }:
{
  boot = {
    plymouth = {
      enable = true;
      theme = "deus_ex";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "deus_ex" ];
        })
      ];
    };

    consoleLogLevel = 0;
    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=0"
      "boot.shell_on_fail"
      "udev.log_priority=0"
      "rd.systemd.show_status=auto"
    ];

    loader.timeout = 3;
  };
}
