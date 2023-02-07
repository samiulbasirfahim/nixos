{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c3a588bc-3ba6-47b9-8c8c-c9cc51d318b0";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/941E-F6BA";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/f5232adb-755f-451f-a157-e2eb0734f6fc";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d1ea16a6-2785-473c-876e-bed970474b05"; }
    ];
}
