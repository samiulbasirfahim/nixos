{modulesPath,...}:{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1ca8adc0-3025-447a-90e3-b48143281919";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/1F98-B486";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/ddac6294-6c47-43f2-ba75-de22478cace7";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/1837309a-7a23-4099-9f13-5d32772cbe04"; }
    ];
}
