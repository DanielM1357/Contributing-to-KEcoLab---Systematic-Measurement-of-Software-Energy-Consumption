# Issues Running Test Existing Scripts

[Dolphin test](#runing-dolphin-test) \
[Discover test](#running-discover-test) \
[Firefox test](#running-firefox-test)

## Runing Dolphin Test
Steps taken:
- Go to [repository's](https://invent.kde.org/kde-linux/os-autoinst-distri-kdelinux/-/blob/master/README.md?ref_type=heads) root
- Inside root, activate venv (`source venv/bin/activate`)
- Than run command:
```bash
PYTHONPATH=. TEST_WITH_CLEAN_HOME=0 TEST_WITH_VIDEO_RECORDER=0   KWIN_PID=$(pgrep -n kwin_wayland)   selenium-webdriver-at-spi-run python3 tests/kdelinux/app/dolphin.py
```
Output:
```bash
I, [2026-11-13T22:40:14.896148 #4385]  INFO -- : Installing dependencies
/home/admin/kecolab_repositories/os-autoinst-distri-kdelinux/venv/bin/pip3
I, [2026-11-13T22:40:15.276698 #4385]  INFO -- : using existing dbus session
I, [2026-11-13T22:40:15.325645 #4385]  INFO -- : not up yet
 * Serving Flask app 'selenium-webdriver-at-spi.py'
 * Debug mode: off
I, [2026-11-13T22:40:15.831064 #4385]  INFO -- : starting test ["python3", "tests/kdelinux/app/dolphin.py"]

Running tests...
----------------------------------------------------------------------
qt.accessibility.atspi: AtSpiAdaptor::applicationInterface does not implement "GetApplicationBusAddress" "/org/a11y/atspi/accessible/root"
  test_delete_file_and_empty_trash (__main__.DolphinTests.test_delete_file_and_empty_trash)
Move a file to the trash in Dolphin then empty it. ... Failed to get layout index "Unexpected reply signature: got \"u\" (uint), expected \"i\" (int)" defaulting to us
Failed to get layout index "Unexpected reply signature: got \"u\" (uint), expected \"i\" (int)" defaulting to us
Failed to get layout index "Unexpected reply signature: got \"u\" (uint), expected \"i\" (int)" defaulting to us
ERROR (5.972s)

======================================================================
ERROR [5.972s]: test_delete_file_and_empty_trash (__main__.DolphinTests.test_delete_file_and_empty_trash)
Move a file to the trash in Dolphin then empty it.
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/admin/kecolab_repositories/os-autoinst-distri-kdelinux/tests/kdelinux/app/dolphin.py", line 64, in test_delete_file_and_empty_trash
    self.driver.find_element(AppiumBy.NAME, 'Move to Trash').click()
    ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/admin/.local/lib/python3.14/site-packages/selenium/webdriver/remote/webdriver.py", line 898, in find_element
    return self.execute(Command.FIND_ELEMENT, {"using": by, "value": value})["value"]
           ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/admin/.local/lib/python3.14/site-packages/selenium/webdriver/remote/webdriver.py", line 429, in execute
    self.error_handler.check_response(response)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^
  File "/home/admin/.local/lib/python3.14/site-packages/appium/webdriver/errorhandler.py", line 125, in check_response
    raise exception_class(msg=message, stacktrace=format_stacktrace(stacktrace))
selenium.common.exceptions.NoSuchElementException: Message: no such element; For documentation on this error, please visit: https://www.selenium.dev/documentation/webdriver/troubleshooting/errors#no-such-element-exception


----------------------------------------------------------------------
Ran 1 test in 7.008s

FAILED (errors=1)

Generating XML reports...
I, [2026-11-13T22:40:23.003968 #4385]  INFO -- : tests done
I, [2026-11-13T22:40:23.022002 #4385]  INFO -- : run.rb exiting false
```

## Running Discover Test
Steps taken:
- Go to [repository's](https://invent.kde.org/kde-linux/os-autoinst-distri-kdelinux/-/blob/master/README.md?ref_type=heads) root
- Inside root, activate venv (`source venv/bin/activate`)
- Than run command:
```bash
PYTHONPATH=. TEST_WITH_CLEAN_HOME=0 TEST_WITH_VIDEO_RECORDER=0   KWIN_PID=$(pgrep -n kwin_wayland)   selenium-webdriver-at-spi-run python3 tests/kdelinux/app/discover_upgrade.py
```

Output:
```bash
I, [2026-11-13T23:02:01.916228 #5124]  INFO -- : Installing dependencies
/home/admin/kecolab_repositories/os-autoinst-distri-kdelinux/venv/bin/pip3
I, [2026-11-13T23:02:02.293798 #5124]  INFO -- : using existing dbus session
I, [2026-11-13T23:02:02.327020 #5124]  INFO -- : not up yet
 * Serving Flask app 'selenium-webdriver-at-spi.py'
 * Debug mode: off
I, [2026-11-13T23:02:02.834469 #5124]  INFO -- : starting test ["python3", "tests/kdelinux/app/discover_upgrade.py"]

Running tests...
----------------------------------------------------------------------
org.kde.plasma.libdiscover: Plugin "systemdsysupdate-backend" doesn't have the right IID "" expected org.kde.discover.6.8.2.AbstractResourcesBackendFactory
org.kde.plasma.libdiscover: Didn't find any Discover backend!
qrc:/qt/qml/org/kde/discover/qml/DiscoverWindow.qml:127:5: QML Shortcut: Shortcut: Only binding to one of multiple key bindings associated with 15. Use 'sequences: [ <key> ]' to bind to all of them.
org.kde.plasma.libdiscover: OdrsReviewsBackend: Fetch ratings: true
qt.qml.propertyCache.append: Member focusPolicy of the object CarouselPageIndicator_QMLTYPE_337 overrides a member of the base object. Consider renaming it or adding final or override specifier
qt.qpa.services: Failed to register with host portal QDBusError("org.freedesktop.portal.Error.Failed", "Could not register app ID: Connection already associated with an application ID")
qt.accessibility.atspi: AtSpiAdaptor::applicationInterface does not implement "GetApplicationBusAddress" "/org/a11y/atspi/accessible/root"
  test_upgrade (__main__.DiscoverTests.test_upgrade)
Run a full system upgrade. ... Failed to get layout index "Unexpected reply signature: got \"u\" (uint), expected \"i\" (int)" defaulting to us
qrc:/qt/qml/org/kde/discover/qml/UpdatesPage.qml:40:5: QML OverlaySheet: Binding loop detected for property "y":
qrc:/qt/qml/org/kde/kirigami/templates/OverlaySheet.qml:122:5
ERROR (60.555s)

======================================================================
ERROR [60.555s]: test_upgrade (__main__.DiscoverTests.test_upgrade)
Run a full system upgrade.
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/admin/kecolab_repositories/os-autoinst-distri-kdelinux/tests/kdelinux/app/discover_upgrade.py", line 46, in test_upgrade
    update_button = wait.until(
        ec.element_to_be_clickable((AppiumBy.NAME, "Update All"))
    )
  File "/home/admin/.local/lib/python3.14/site-packages/selenium/webdriver/support/wait.py", line 146, in until
    raise TimeoutException(message, screen, stacktrace)
selenium.common.exceptions.TimeoutException: Message: 


----------------------------------------------------------------------
Ran 1 test in 62.624s

FAILED (errors=1)

Generating XML reports...
I, [2026-11-13T23:03:05.618179 #5124]  INFO -- : tests done
I, [2026-11-13T23:03:05.639659 #5124]  INFO -- : run.rb exiting false
```

## Running Firefox Test
Steps taken:
- Go to [repository's](https://invent.kde.org/kde-linux/os-autoinst-distri-kdelinux/-/blob/master/README.md?ref_type=heads) root
- Inside root, activate venv (`source venv/bin/activate`)
- Than run command:
```bash
PYTHONPATH=. TEST_WITH_CLEAN_HOME=0 TEST_WITH_VIDEO_RECORDER=0   KWIN_PID=$(pgrep -n kwin_wayland)   selenium-webdriver-at-spi-run python3 tests/kdelinux/app/firefox.py
```

Output:
```bash
I, [2026-11-13T23:13:19.781552 #5621]  INFO -- : Installing dependencies
/home/admin/kecolab_repositories/os-autoinst-distri-kdelinux/venv/bin/pip3
I, [2026-11-13T23:13:20.277980 #5621]  INFO -- : using existing dbus session
I, [2026-11-13T23:13:20.318389 #5621]  INFO -- : not up yet
 * Serving Flask app 'selenium-webdriver-at-spi.py'
 * Debug mode: off
I, [2026-11-13T23:13:20.825789 #5621]  INFO -- : starting test ["python3", "tests/kdelinux/app/firefox.py"]

Running tests...
----------------------------------------------------------------------
ln: failed to create symbolic link '/home/admin/.mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/../../../share/runtime/locale/en/langpack-en-GB@firefox.mozilla.org.xpi': No such file or directory
[2] Sandbox: CanCreateUserNamespace() clone() failure: EPERM

======================================================================
ERROR [0.000s]: setUpClass (__main__.FirefoxTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/admin/kecolab_repositories/os-autoinst-distri-kdelinux/tests/kdelinux/app/firefox.py", line 23, in setUpClass
    self.firefox, _ = flatpak.launch(FIREFOX_APP_ID, 'Firefox')
                      ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/admin/kecolab_repositories/os-autoinst-distri-kdelinux/lib/sut/flatpak.py", line 11, in launch
    pid = find_pid_on_atspi_bus(atspi_name, timeout)
  File "/home/admin/kecolab_repositories/os-autoinst-distri-kdelinux/lib/sut/atspi.py", line 21, in find_pid_on_atspi_bus
    raise RuntimeError(f'"{app_name}" did not appear on the AT-SPI bus within {timeout}s')
RuntimeError: "Firefox" did not appear on the AT-SPI bus within 30s

----------------------------------------------------------------------
Ran 0 tests in 30.104s

FAILED (errors=1)

Generating XML reports...
I, [2026-11-13T23:13:51.118813 #5621]  INFO -- : tests done
I, [2026-11-13T23:13:51.157521 #5621]  INFO -- : run.rb exiting false
```
