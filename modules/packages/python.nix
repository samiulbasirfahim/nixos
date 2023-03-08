{pkgs, ...}:

let
  my-python-packages = p: with p; [
    pandas
    requests
    qrcode
    numpy
    pyautogui
    pyttsx3
    pip
    # other python packagesp
  ];
in
{
  environment.systemPackages = [
    (pkgs.python3.withPackages my-python-packages)
  ];
}
