{pkgs, ...}: {
  # Use the systemd-boot EFI boot loader.
  boot.plymouth = {
    enable = true;
    themePackages = [pkgs.adi1090x-plymouth];
    theme = "loader_2";
  };
}
