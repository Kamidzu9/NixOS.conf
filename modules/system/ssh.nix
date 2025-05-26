{
  # SSH Härtung
  services.openssh.enable = false; # true wenn ich mit ssh verbinden will
  # services.openssh.permitRootLogin = "no";
  # services.openssh.passwordAuthentication = false;
  # services.openssh.extraConfig = ''
  #  AllowUsers ${env.myUser}
  #  PermitEmptyPasswords no
  # '';
}
