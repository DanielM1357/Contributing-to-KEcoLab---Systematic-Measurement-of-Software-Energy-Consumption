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


