{
  # Firewall
  networking.firewall = {
    enable = true;
    # або так (список портів і діапазонів):
    allowedTCPPorts = [ 22 ]; # ssh
    allowedUDPPorts = [ ];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  };
}
