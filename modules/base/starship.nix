{
  lib,
  ...
}:

{
  programs.starship = {
    enable = true;
    enableTransience = true;

    settings = {

      format = lib.concatStrings [
        # "$username"
        # "$hostname"
        "$character"
      ];

      right_format = lib.concatStrings [
        "$directory"
        "$nix_shell"
        "$git_branch"
        "$git_state"
        "$git_commit"
        "$git_status"
        "$python"
        "$rust"
        "$cmd_duration"
        "$time"
      ];

      username = {
        show_always = false;
        format = "[$user]($style)";
        style_user = "blue";
      };

      directory = {
        style = "cyan";
        disabled = true;
        read_only = " ";
      };

      time = {
        format = " \\[[$time]($style)\\]";
        time_format = "%I:%M %p";
        style = "yellow";
        use_12hr = true;
        disabled = false;
      };

      os.format = "[$symbol]($style)";
      os.symbols = {
        NixOS = " ";
        Linux = "󰌽 ";
        Unknown = " ";
      };

      character = {
        success_symbol = "[❯](bold blue)";
        error_symbol = "[❯](bold red)";
        # vimcmd_symbol = "[❮](green)";
      };

      git_branch = {
        symbol = " ";
        format = " \\[[$symbol$branch(:$remote_branch)]($style)\\]";
      };

      git_commit = {
        style = "green";
        only_detached = false;
        format = "\\[[$hash$tag]($style)\\]";
      };

      git_state = {
        style = "yellow";
        format = "\\[[$state($progress_current/$progress_total)]($style)\\]";
      };

      git_status = {
        style = "red";
        #up_to_date = "";
        format = "([\\[$all_status$ahead_behind\\]]($style))";
      };

      memory_usage = {
        disabled = false;
        threshold = 0;
        symbol = "󰍛 ";
        format = " \\[[$symbol$ram_pct]($style)\\]";
        style = "purple";
      };

      nix_shell = {
        format = " \\[[$symbol$state($name)]($style)\\]";
        symbol = " ";
        style = "blue";
        disabled = false;
      };

      python = {
        symbol = "󰌠 ";
        style = "yellow";
        format = " \\[[$symbol($version)]($style)\\]";
      };

      rust = {
        format = " \\[[$symbol($version)]($style)\\]";
        symbol = "󱘗 ";
        style = "red";
      };

      cmd_duration = {
        format = " \\[[⏱ $duration]($style)\\]";
        style = "green";
      };

    };
  };
}
