{ config, pkgs, ... }:

{
  programs = {
    mako = {
      enable = true;
      font = "Operator Mono Book 12";
      padding = "20";
      defaultTimeout = 5000;
      borderSize = 1;
      borderRadius = 0;
      backgroundColor = "#1e1e2e";
      borderColor = "#89b4fa";
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
