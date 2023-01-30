{
    pkgs,
    ...
} : {
    boot = {
        cleanTmpDir = true;
        kernelPackages = pkgs.linuxPackages_zen;
        kernelModules = [ "kvm-amd" ];

        initrd = {
            kernelModules = [ "amdgpu" ];
            availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
        };
        
        loader = {
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
