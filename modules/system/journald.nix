{
  # Journald Begrenzung
  services.journald.extraConfig = ''
    SystemMaxUse=50M
    RuntimeMaxUse=50M
    ForwardToSyslog=no
  '';
}
