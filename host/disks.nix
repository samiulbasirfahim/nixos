{modulesPath,...}:{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/eb8f5fe5-fdfe-4b73-9bc0-a751669271fe";
      fsType = "ext4";
    };
  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/4790-F84B";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/47cc0b32-892e-47be-b306-c1da8cb1bbc2";
      fsType = "ext4";
    };
  swapDevices =
    [ { device = "/dev/disk/by-uuid/187e9e42-6556-4961-a11b-07618de6dbd0"; }
    ];
}
