let
  env = import ../../config/env.nix;
in
{

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = env.battGov;
      turbo = env.battTurbo;
    };
    charger = {
      governor = env.acGov;
      turbo = env.acTurbo;
    };
  };
}
