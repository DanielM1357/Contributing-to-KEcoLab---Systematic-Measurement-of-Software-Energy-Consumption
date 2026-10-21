# setup vm with fedora and kde desktop - **Link**
# update fedora system
```bash
sudo dnf upgrade
```
# install ydotool
## clone repo
Clone the ydotool repo and install the application by:

```bash
git clone -b feat/setup-script https://invent.kde.org/neogg/ydotool.git
cd ydotool
chmod +x setup.sh
./setup.sh install
```
NOTE: a newly set up fedora machine will have to be some additional programs to be installed:
cmake, a g++/clang (c++ compiler), scdoc

Install by (if you rather want clang just swap g++ with clang):
```bash
sudo dnf install cmake g++ scdoc
```

Also give `ydotoold` permissions to `uinput`:
```bash
sudo touch /etc/udev/rules.d/99-uinput.rules
echo 'KERNEL=="uinput", MODE="0660", GROUP="input"' | sudo tee /etc/udev/rules.d/99-uinput.rules > /dev/null
sudo usermod -aG input "$USER"

sudo udevadm control --reload-rules
sudo udevadm trigger
```

Reboot the system and type the following command to start `ydotoold`:
```bash
systemctl --user start ydotoold
```

To verify, that everything worked you can try some ydotool commands, f.e. lets try to do the bash command `ls`:
```bash
ydotool type "ls" && ydotool key 28:1 28:0
```

This types "ls" to the command-line and key does press keys - 28 stands for enter, 0 is release and 1 is press.

A keymap where all keys are described can be found in `/usr/include/linux/input-event-codes.h`.
