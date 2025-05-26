{
  # AppArmor
  security.apparmor.enable = true;

  # Kernel / Sysctl Härtung
  boot.kernel.sysctl = {
    "kernel.randomize_va_space" = 2; # ASLR maximal
    "kernel.kptr_restrict" = 2; # keine Kernel-Symbole
    "fs.suid_dumpable" = 0; # kein core-Dump von setuid
    "net.ipv4.ip_forward" = 0;
    "net.ipv4.conf.all.rp_filter" = 1;
  };
}
