{ lib
, config
, pkgs
, ...
}: {
  hardware = {
    
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };

  };
}
