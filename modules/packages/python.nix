{pkgs, ...}:

let
  my-python-packages = p: with p; [
    pandas
    numpy
    pyautogui
    # other python packages
  ];
in
{
  environment.systemPackages = [
    (pkgs.python3.withPackages my-python-packages)
  ];
}
