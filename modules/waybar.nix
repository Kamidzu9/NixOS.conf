{
  home.file.".config/hypr/scripts/toggle-waybar.sh" = {
    text = ''
      #!/bin/bash
      PID=$(pgrep waybar)
      if [[ -n "$PID" ]]; then
        kill "$PID"
      else
        waybar &
      fi
    '';
    executable = true;
  };
}

