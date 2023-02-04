# AIOS Desktop Manual

## Description

The AIOS Desktop is made up of a variety of tools, and this document hopes to explain them all.

AIOS makes use of a customized i3 window manager, an AppImage package manager and store, and a customized xfce4-panel.

In other words, there are three parts (with subsections) of the AIOS desktop to understand:
1) [Window Management](#window-management)
   + [Basic Functionality](#basic-functionality)
   + [Useful Applications](#useful-applications)
   + [Window Control](#window-control)
     * [Window Focus](#window-focus)
     * [Movement](#movement)
     * [Resizing](#resizing)
   + [Workspaces](#workspaces)
2) [Application Management](#application-management)
3) [Top Bar Tools](#top-bar-tools)
   + [Applications Menu](#applications-menu)
   + [Window buttons](#window-buttons)
   + [Status Tray](#status-tray)
     * [Internet](#internet)
     * [Bluetooth](#bluetooth)
     * [Audio Settings](#audio-settings)
   + [Workspace List](#workspace-list)
   + [Status Widgets](#status-widgets)

This document is reference material for them.

## Window Management

If you look at the AIOS i3 config (~/.config/i3/config), there are some clear subsections to talk about:
- [Basic Functionality](#basic-functionality)
- [Useful Applications](#useful-applications)
- [Window Control](#window-control)
  + [Window Focus](#window-focus)
  + [Movement](#movement)
  + [Resizing](#resizing)
- [Workspaces](#workspaces)

### Basic Functionality

- The window manager used on AIOS is called i3, but it has been customized to fit the needs of the OS and to have "sane defaults"
- i3 is a tiling window manager meaning windows are automatically placed and "tiled" around the screen, so you don't have to do it manually.
- The primary way to do anything in i3 is through the use of shortcuts, although there are some mouse options which are talked more about in the "Window Control" section.
- The keybindings all use the "Super" key (that's the key that's often labeled with the Windows logo) as a base.
- Some basic commands to know unrelated to window management and movement are:
  + `super` + `x` to close applications
  + `super` + `shift` + `e` (for "exit") to log out
  + `super` + `shift` + `r` (for "reload") to reload in case of an issue
  + `super` + `f` (for "full screen") to make an application full screen (hit it again to exit full screen)
  + `super` + `l` (for "lock") to lock your computer
- You can also control the volume in i3 using the volume keys on your device.

### Useful Applications

Along with window management, there are a few handy applications you can start from i3:
- `super` + `shift` + `s` (for "screenshot") will start up a screenshot utility
- `super` + `return` will start up a terminal emulator
- `super` + `s` (for "search") will start up the application search (where you can launch more applications)

### Window Control

#### Window Focus

You can select which window you want to work in without even touching the mouse.

Simply hit `super` + `up`/`down`/`left`/`right` to focus on the window to that is up/down/left/right of the one you're currently on.

You can also move the mouse to a window to focus it (no need to click).

#### Movement

Windows can be moved around the screen similar to the focus commands, but now with `shift`, i.e. `super` + `shift` + `up`/`down`/`left`/`right`

You can also move windows around with the mouse. Hit `super`, click the left mouse on the window you want to move, and drag into place. When moving, a blue box will appear to indicate where the window will end up.

It should be noted that by default new windows will be placed following a fibonnaci spiral.

__Adjusting to Horizontal/Vertical__

You can also control *how* windows move up/down/left/right.

If you hit `super` + `h` (for "horizontal"), then the next window you open will be placed to the right of your current window, and if you hit `super` + `h`, navigate to a window above or below you then press `super` + `shift` + `down`/`up`, respectfully, you will move that window into horizontal alignment.

The same is true with `super` + `v` (for "vertical"), but for vertical.

__Stacking:__

Windows can be stacked on top of each other by hitting `super` + `control` + `s` (for "stack").

To undo the stack, simply move the window with the mouse or with the `super` + `shift` method.

If a window is in "stacking mode," you can drag windows on top of it to add it to the stack.

There is a version of stacking called "tabbing" which works with horizontal tabs instead of vertical. This is activated with `super` + `w`

To return to the normal non-stacking mode (called "split" mode), press `super` + `e`

__Floating:__

To make a window float and not be tiled, hit `super` + `shift` + `f`. You can move these windows around the screen with the `super` + left click method.

To return it to being tiled, hit the input again.

#### Resizing

Windows can be resized by entering "resize mode."

To enter resize mode, hit `super` + `r` (for "resize"). Hit it again or `escape` to exit resize mode.

When in resize mode, you can hit `up` to decrease height, `down` to increase it, `left` to decrease width, and `right` to increase it.

Alternatively, you can hit `super` and right click and drag windows to resize them. A counter to the left click and move.

### Workspaces

You may run out of space on your screen for windows. This is what workspaces are for. There are 10 workspaces (1-9 and 0 for 10), where you can place windows.

To move to a workspace hit `super` and the number of the workspace to move to.

To move a window to a workspace hit `super` + `shift` + the number of the workspace to move it to.

## Application Management

The primary way to get applications in AIOS is through AppImages downloaded to ~/Applications

A few of these come installed like:
- `appimaged` which runs in the background and automatically finds AppImages in your Applications folder and adds them to system menus
- `firefox` - a free and open source web browser
- `libreoffice` - a powerful office suite.
- `alacritty` - a nice terminal emulator
- `neovim` - a powerful rewrite of the classic vim text editor which comes preconfigured with many plugins for developers, writers, and more, so you can get right to work! You may want to run `:PlugInstall` one time after installing the base system.
- `mupdf` - a simple pdf reader (how you're probably reading this document!)
- `thunar` - a simple file manager that's part of the Xfce4 desktop suite
- `gnome-screenshot` - an easy to use screenshot tool.

If you want more applications though, the way you do that is through a program that comes installed called "Aipster."

Aipster is shrot for "AppImage Store (-er)" and is a graphical front-end for the terminal application, aip-man, the "AppImage Package Manager."

Through aipster, you can view available applications, download them, upgrade them, and remove them.

Aip-man can install, remove, and upgrade as well through the commands `aipman install <pkg>`, `aipman remove <pkg>`, and `aipman upgrade`. To see all the things aip-man can do, run `aipman --help`

## Top Bar Tools

The tools to know in the top bar are:
- [Applications Menu](#applications-menu)
- [Window buttons](#window-buttons)
- [Status Tray](#status-tray)
  + [Internet](#internet)
  + [Bluetooth](#bluetooth)
  + [Audio Settings](#audio-settings)
- [Workspace List](#workspace-list)
- [Status Widgets](#status-widgets)

### Applications Menu

Click on the "Applications" button in the top left corner of your screen.

That is the Applications Menu. From there you can select from among many categories which contain launchers to your installed Applications.

### Window Buttons

Next to the Applications Menu is a list of currently opened windows. You can click on them to gain focus, but it's mostly for seeing what's open as it shows windows from all workspaces and windows.

There are some window options if you right click on a listed window though.

### Status Tray

Here, some applications will put up a little icon that can be interacted with.

There are a few there by default.

#### Internet

The internet tray icon can be left clicked to choose a Wifi or Ethernet connection. Right clicking will allow you to edit, create, and remove connections manually as well as turn off wifi or internet all togther.

#### Bluetooth

Clicking the bluetooth icon will open up a bluetooth device manager which allows you to pair with, connect, and disconnect from bluetooth devices.

#### Audio Settings

Clicking on the volume icon will allow you to select input and output devices and control the volume for each.

At the bottom of the applet is the button "Audio Mixer" which will open an application that allows for more control and tweaking of audio settings including device modes, left/right channels, default sources, locking volume channels, application specific control, etc.

### Workspace List

There is a list of current and used workspaces. Clicking on a number will take you to that workspace.

### Status Widgets

There are a few extra things on the top bar that are just handy to have.

This includes a date and clock, a battery percentage with time to full charge/empty, and space left on your primary hard drive.

