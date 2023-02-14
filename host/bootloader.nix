{
    pkgs,
    ...
} : {
    boot = {
        cleanTmpDir = true;
        kernelPackages = pkgs.linuxPackages_zen;
        kernelModules = [ "kvm-amd" ];
        plymouth = {
            enable = true;
            theme = "glitch";
            themePackages = [
              (pkgs.stdenv.mkDerivation {
                name = "plymouth-themes";
                src = pkgs.fetchFromGitHub {
                  owner = "adi1090x";
                  repo = "plymouth-themes";
                  rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
                  sha256 = "sha256-VNGvA8ujwjpC2rTVZKrXni2GjfiZk7AgAn4ZB4Baj2k=";
                };
                installPhase = ''
                mkdir $out/share/plymouth/themes -p
                chmod +w -R $out/share/plymouth
                for f in $src/pack_*/*; do
                  cp -r $f $out/share/plymouth/themes/
                done
                chmod +w $out -R
                find $out -type f | while read file; do
                  sed -i 's;/usr/share/plymouth;/etc/plymouth;g' "$file"
                done
                '';
              })
          ];
        };
        initrd = {
            kernelModules = [ "amdgpu" ];
            availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
        };

        loader = {
            timeout = 0;
            systemd-boot = {
                enable = true;
            };
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot/efi";
            };
        };
    };
}
