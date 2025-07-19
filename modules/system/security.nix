let 
  env = import ../../config/env.nix;
in
{
  # LUKS
  boot.initrd.luks.devices."luks-${env.myLuksUUID}".device = "/dev/disk/by-uuid/${env.myLuksUUID}";

  # AppArmor
  security.apparmor.enable = true;

  # Kernel / Sysctl Härtung
  boot.kernel.sysctl = {
    "fs.protected_fifos" = 2;
    "fs.protected_regular" = 2;
    "kernel.sysrq" = 0;
    "net.core.bpf_jit_harden" = 2;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "kernel.randomize_va_space" = 2; # ASLR maximal
    "kernel.kptr_restrict" = 2; # keine Kernel-Symbole
    "fs.suid_dumpable" = 0; # kein core-Dump von setuid
    "net.ipv4.ip_forward" = 0;
    "net.ipv4.conf.all.rp_filter" = 1;
  };

  systemd.services."docker.service".serviceConfig = {
    PrivateTmp = true;
    NoNewPrivileges = true;
    RestrictAddressFamilies = [ "AF_INET" "AF_INET6" ];
  };

  security.audit.enable = true;
  security.auditd.enable = true;

  boot.blacklistedKernelModules = [ "usb_storage" ];

  # Sudo hart
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = true;
}
