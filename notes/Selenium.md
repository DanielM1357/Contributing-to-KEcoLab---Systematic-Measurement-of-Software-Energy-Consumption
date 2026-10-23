# GUI Testing with Selenium-webdrive-AT-SPI

## Overview
**[Selenium](https://www.selenium.dev/)** A Browser automation framework.\
**[Driver](https://www.w3.org/TR/webdriver/)** The server component of Selenium.\
**[Appium](https://appium.io/docs/en/latest/)** An extension to Selenium making it more useful for app testing.\
**[AT-SPI2](https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/?__goaway_challenge=meta-refresh&__goaway_id=19ee1302882ecd1a45f3a544fe70e82f)** A protocol over DBus, which GUI toolkit widgets use to provide their content to screen readers.

## Installing Dependencies 
Some or most of the following packages might already being installed on the fedora distro, but to make sure, run the install commands through your package manger.
```bash
sudo dnf install \ 
at-spi2-core \ 
python3-pyatspi \ 
accerciser \ 
gobject-introspection
```
- A supported `python3` version (at the time of writing >=3.7 ("This page was last edited on 25 September 2025, at 09:19."))
- https://gitlab.gnome.org/GNOME/at-spi2-core
- https://gitlab.gnome.org/GNOME/pyatspi2
- https://gitlab.gnome.org/GNOME/accerciser
- https://gitlab.gnome.org/GNOME/gobject-introspection

These dependencies need to be installed in order to be able to build `selenium-webdriver-at-spi` in the next steps:

```bash
sudo dnf install \ 
extra-cmake-modules \ 
qt6-qtbase-devel \ 
qt6-qtbase-private-devel \ 
qt6-qtdeclarative-devel \ 
kf6-kwindowsystem-devel \ 
kwayland-devel \ 
kpipewire-devel \ 
kwin-devel \ 
wayland-devel
```

Installing python dependecies:
```bash
sudo dnf install \ 
python3-pyatspi \ 
python3-gobject
```

## Installing Selenium-webdriver-AT-SPI
```bash
git clone https://invent.kde.org/sdk/selenium-webdriver-at-spi.git
cd selenium-webdriver-at-spi
# For virtual environment
python3 -m venv venv
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

## Writing Tests in Selenium
It is possible to write test scripts in **any language**.\
For us the **best choice is Python** as most devs are familiar with it and the KecoLab team suggested that we use it when porting the current scripts to Selenium.\
(As of the writing of this document (2026-10-19) we are waiting on a final decision if Python is the choosen language for the project, based on other KDE developers feedback.)

### Creating a Test Class
Import the necessary libraries so Selenium and Appium works.
>TODO: Ask if we should use unittest, or pytest, or something other.

(The body of the class will be filled in the next part)

```python
import unittest
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.common.base import AppiumOptions
from selenium.webdriver.support.ui import WebDriverWait

class SimpleCalculatorTests(unittest.TestCase):
    pass

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(SimpleCalculatorTests)
    unittest.TextTestRunner(verbosity=2).run(suite)
```

Setting up the body of the class.This is a boilerplate code, that can be reused with little to no changes.
>TODO: Take a deeper look at how certain elements work

The line `options.set_capability("app", "org.kde.kcalc.desktop")` will start the `KCalc` calculator app (as the example app).

Make sure to have the termination classmethod (`def tearDownClass()`).

```python
@classmethod
    def setUpClass(self):
        options = AppiumOptions()
        # The app capability may be a command line or a desktop file id.
        options.set_capability("app", "org.kde.kcalc.desktop")
        # Boilerplate, always the same
        self.driver = webdriver.Remote(
            command_executor='http://127.0.0.1:4723',
            options=options)
        # Set a timeout for waiting to find elements. 
        # If elements cannot be found in time we'll get a test failure. 
        # This should be somewhat long so as to not fall over when the system
        # is under load, but also not too long that the test takes forever.
        self.driver.implicitly_wait = 10

    @classmethod
    def tearDownClass(self):
        # Make sure to terminate the driver again, lest it dangles.
        self.driver.quit()
```
>Work in Progress