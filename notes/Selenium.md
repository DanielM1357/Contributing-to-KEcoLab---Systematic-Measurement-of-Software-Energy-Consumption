# GUI Testing with Selenium-webdrive-AT-SPI

## Overview
**[Selenium](https://www.selenium.dev/)** A Browser automation framework.\
[Selenium repository](https://invent.kde.org/sdk/selenium-webdriver-at-spi) \
**[Driver](https://www.w3.org/TR/webdriver/)** The server component of Selenium.\
**[Appium](https://appium.io/docs/en/latest/)** An extension to Selenium making it more useful for app testing.\
**[AT-SPI2](https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/?__goaway_challenge=meta-refresh&__goaway_id=19ee1302882ecd1a45f3a544fe70e82f)** A protocol over DBus, which GUI toolkit widgets use to provide their content to screen readers.

## Installing Dependencies 
Some or most of the following packages might already being installed on the fedora distro, but to make sure, run the install commands through your package manger.

- A supported `python3` version (at the time of writing >=3.7 ("This page was last edited on 25 September 2025, at 09:19."))
- https://gitlab.gnome.org/GNOME/at-spi2-core
- https://gitlab.gnome.org/GNOME/pyatspi2
- https://gitlab.gnome.org/GNOME/accerciser
- https://gitlab.gnome.org/GNOME/gobject-introspection

or

```bash
sudo dnf install \
at-spi2-core \
python3-pyatspi \
accerciser \
gobject-introspection
```

Installing python and dependencies to be able to create a python venv as well as to be able to run the selenium compiler.
```bash
sudo dnf install \
python3 \
python3-pip \
python3-pyatspi \
python3-pyatspi \
python3-gobject \
at-spi2-core \
accerciser \
cairo-devel
```

Additionally for being able to install PyGObject, which is in `requirements.txt`, execute:
```bash
sudo dnf install gcc \
gobject-introspection-devel \
cairo-gobject-devel \
pkg-config python3-devel \
gtk4
```
[pygobject.gnome.org](https://pygobject.gnome.org/getting_started.html#gettingstarted)

These dependencies need to be installed in order to be able to build `selenium-webdriver-at-spi` in the next steps:

```bash
sudo dnf install \
extra-cmake-modules \
qt6-qtbase-devel \
qt6-qtbase-private-devel \
qt6-qtdeclarative-devel \
kf6-kwindowsystem-devel \
plasma-wayland-protocols-devel \
kwayland-devel \
kpipewire-devel \
kwin-devel \
wayland-devel \
ruby
```

## Installing Selenium-webdriver-AT-SPI
```bash
git clone https://invent.kde.org/sdk/selenium-webdriver-at-spi.git
cd selenium-webdriver-at-spi
# For virtual environment
python3 -m venv --system-site-packages venv
source venv/bin/activate
pip3 install -r requirements.txt
echo export PATH="~/.local/bin:$PATH" >> ${HOME}/.bashrc
mkdir build
cd build
cmake ..
make
sudo make install
cd ..
```
Now that Selenium is built, it can be used to run tests.

## Running Selenium Tests
If you're running your tests inside a VM, make sure to set it up properly.
In this case we are using `QEMU/KVM` V**irtual Machine Manager**.

In the VM's settings go to the **video** tab and make sure the `Mode` is set to `Virtio` and that `3D acceleration` is checked. \
Then under **Display Spice** make sure `OpenGL` is checked and listen type is set to `None`.

Now that the VM is set up and after rebooting the guest machine, you will be able to run the Selenium tests. \
To test if it works you can run the example test by using the following command from the selenium folder.
```bash
selenium-webdriver-at-spi-run ./examples/calculatortest.py
```
If everything is working correctly, a window will open in which the KCalc app will open and the test will run.

Running other selenium tests, make sure to give the whole path to your test python file, otherwise you might run into errors.

## Writing Tests in Selenium
It is possible to write test scripts in **any language**.\
For us the **best choice is Python** as most devs are familiar with it and the KecoLab team suggested that we use it when porting the current scripts to Selenium.

### Creating a Test Class
Import the necessary libraries so Selenium and Appium works.
The class can have any name, (preferably what is being tested), conventionally using uppercase and it must derive from [Python's standard unittest library](https://docs.python.org/3/library/unittest.html). \
[Appium documentation](https://develop.kde.org/docs/apps/tests/appium/)

```python
import unittest
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.common.base import AppiumOptions
from selenium.webdriver.support.ui import WebDriverWait

class YourTestClass(unittest.TestCase):
    @classmethod
    def setUpClass(self) -> None:
        options = AppiumOptions()
        options.set_capability("app", "/path/to/program")
        self.driver = webdriver.Remote(command_executor='http://127.0.0.1:4723', options=options)
        self.driver.implicitly_wait = 10

    @classmethod
    def tearDownClass(self) -> None:
        self.driver.quit()

    @classmethod
    def test_something(self) -> None:
        # Do something here

if __name__ == '__main__':
    unittest.main()
```

This is the base of all test classes. This boiler plate can be used for any testcase.

The first class method is like a constructor. It can also have any name, but usually called "setUpClass". The `AppiumOptions()` provide the default settings of the test.

The `set_capability()` takes a python dictionary.
The first string is the key and the second string is the value.
The list of possible keys and values can be found under [Appium Documentation for Capabilities](https://appium.io/docs/en/2.0/guides/caps/).

--

If we want to test for example the `KCalc` calculator, we need to write `options.set_capability("app", "org.kde.kcalc.desktop")`.

Make sure to have the termination classmethod (`def tearDownClass()`).

>To be continued...
