{ config, pkgs, ... }:

{
  services = {
    mako = {
      enable = true;
      font = "JetbrainsMono nerd font 10.5";
      padding = "20";
      defaultTimeout = 5000;
      borderSize = 2;
      borderRadius = 6;
      backgroundColor = "#1e1e2e";
      borderColor = "#7EA398";
      progressColor = "over #313244";
      textColor = "#cdd6f4";
      extraConfig = ''
        text-alignment=center
        [urgency=high]
        border-color=#B45C65
      '';
    };
  };
}
