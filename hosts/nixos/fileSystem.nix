{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
    fileSystems."/" =
      { device = "/dev/disk/by-uuid/bcca4d6f-b521-4bf0-ad69-a8688ac82b0d";
        fsType = "ext4";
      };

    fileSystems."/boot/efi" =
      { device = "/dev/disk/by-uuid/DF12-7B9F";
        fsType = "vfat";
      };

    fileSystems."/home" =
      { device = "/dev/disk/by-uuid/76728cc4-3b64-4f39-8059-38ee90c37569";
        fsType = "ext4";
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/67148810-bd43-4c77-98e5-cd5e058b7fb7"; }
      ];
}