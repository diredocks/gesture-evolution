# gesture-evolution
KWin Effect makes touchpad gesture on KDE easier for human beings

Maybe you're also interested in [taj-ny/kwin-gestures](https://github.com/taj-ny/kwin-gestures)

## Installation

1. Download the repository as a .zip file.  
2. Extract the files from the downloaded .zip archive.  
3. Open your terminal and execute the following command to install the gesture-evolution package:  
```
kpackagetool6 --type KWin/Effect --install gesture-evolution/src
```

## Upgrade

Same as above, but with command:
```
kpackagetool6 --type KWin/Effect --upgrade gesture-evolution/src
```
re-login to take effect.

## Configuration

Go to `System Settings -> Desktop Effects -> Gesture Evolution`

## Usage

**Settings won't work in latest version, because I haven't got time to implement that. XD**


As for commit `672a2a8ac2058521d64091e0cf79127cd7e5b927` and earlier:

1. Perform a three-finger swipe upwards or downwards to toggle the maximized (or fullscreen) state of the current window.
2. Pinch your fingers together to close (or minimize) the current window.
