# The scripts which are actually written in bash
To be able to run the scripts you need the flatpak version of the application. As this script is now for Okular, the `org.kde.okular` package
needs to be installed by running `flatpak install org.kde.okular`.
If not installed, the script is not able to start the application.

Also the scripts have to be executable, which is done by `chmod u+x <file-name>`. After these steps the script can be started and will run.
For example starting the idle script would be `./log_idle.sh`

The scripts have principially the same structure until it comes to the testing for-loop. Each one has a syncUp-function defined, which sets sleep for the given time. 
`startAction()` and `stopAction()` will log the exact time of each action's start and stop to `~/log_usage_scenario`, as each action is wrapped with both functions. These functions are only defined in sus and idle scenario, as with baseline-scenario it's not needed. 

## Okular baseline scenario

This scenario is the most simple one, as there's not application started or anything else done, than logging the time of each iteration's start/end and waiting for 218s (including burn-in time of 60s and cooldown of 30s)

## Okular idle scenario

The idle scenario additionally contains the start of the application. Furthermore it will let Okular run for 220 seconds and then close it, which makes the scenario of the plain application running, with no actions done.

## Okular sus scenario

For running the system usage scenario, the configuration of the following key-shortcuts have to be made:

- Rotate Left: Ctrl+l
- Rotate Right: Ctrl+r
- Invert color: Ctrl+i
- Fit to width: Ctrl+Shift+w
- Single page mode: Ctrl+Alt+s

Also make shure that ydotool is running, 

The lines until the main for-loop are basically the same as in the idle script. For simulating the usage, a PDF-file is needed. The path of this file is checked during the script at the beginning, and downloaded, if the file is not existing. 
As the for loop starts, the pdf gets copied to the home directory: 

```bash
cp ~/Documents/okular/20yearsofKDE.pdf ~/Documents/20yearsofKDE
```

After copying the file and a wait time of 60s the file gets opened with:
```bash
flatpak run org.kde.okular ~/Documents/20yearsofKDE > /dev/null 2>&1 &
```
`/dev/null 2>&1 &`suspends the output, so no output is given to the command line.
