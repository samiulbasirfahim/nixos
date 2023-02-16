{...} : {
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{
          users = ["fahim"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}