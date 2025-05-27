{ pkgs, ... }:

let
  logFile = "/var/log/chkrootkit.log";
in
{
  # Install chkrootkit and coreutils for shell
  environment.systemPackages = [ pkgs.chkrootkit pkgs.coreutils ];

  # Service that runs the chkrootkit scan once
  systemd.services."chkrootkit-check" = {
    description = "Run chkrootkit scan";
    wants = [ "network.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      # Treat non-zero exit (e.g., findings) as success
      SuccessExitStatus = [ 0 1 ];
    };
    # Use `script` for simple shell commands
    script = ''
      echo "=== chkrootkit run on $(date) ===" >> ${logFile}
      ${pkgs.chkrootkit}/bin/chkrootkit -q >> ${logFile} 2>&1
    '';
    wantedBy = [ "multi-user.target" ];
  };

  # Timer to trigger the scan weekly
  systemd.timers."chkrootkit-check" = {
    description = "Weekly chkrootkit scan";
    wants = [ "chkrootkit-check.service" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
    wantedBy = [ "timers.target" ];
  };
}

