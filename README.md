# ./dotfiles

![screenshot](./screenshot.png)

Your dotfiles are how you personalize your system. These are mine.

## Components

There's a few special files in the [hierarchy]

**`~/.config/`**

Application configuration and state. pplications should fall back to defaults
should their configuration or state in this directory be missing. If an
application finds `$XDG_CONFIG_HOME` set, it should use the directory specified
in it instead of this directory.

**`~/.local/bin/`**

Executables that shall appear in the user's `$PATH` search path. It is
recommended not to place executables in this directory that are not useful for
invocation from a shell; these should be placed in a subdirectory of
`~/.local/lib/` instead.

**`~/.local/share/`**

Resources shared between multiple packages, such as fonts or artwork. Usually,
the precise location and format of files stored below this directory is subject
to specifications that ensure interoperability. If an application finds
`$XDG_DATA_HOME` set, it should use the directory specified in it instead of
this directory.

**`~/.fonts`**

Install a font manually by downloading the appropriate `.ttf` or `.otf` files
and placing them into:

- `/usr/local/share/fonts` — system-wide
- `~/.local/share/fonts` — user-specific
- `~/.fonts` — user-specific

These files should have the permission 644, otherwise they may not be usable.

## Software

I mainly run on Debian, mostly with open source tools.

The philosophy of Unix is what i seeks to keep, minimalist and modular software
development. Design for simplicity and increase complexity only where you need
to.

### Browsers

- `chromium`
- `firefox`
- `lynx`
- `links` — Lynx-like alternative character mode WWW browser

### X11

- `arandr` — Another XRandR GUI
- `grabc` — Grab the color of some pixel in X11
- `light` — Backlight controllers
- `lxappearance` — Standard theme switcher of LXDE
- `mons` — POSIX Shell script to quickly manage monitors on X
- `picom` — A lightweight compositor for X11
- `wmctrl` — interact with a EWMH/NetWM compatible X Window Manager
- `xbacklight` — Adjust backlight brightness using RandR extension
- `xclip` — Command line interface to the X11 clipboard
- `xdotool` — command-line X11 automation tool
- `xwininfo` — window information utility for X

### Development

- `alacritty` — GPU accelerated terminal emulator
- `datagrip` — Multi-engine database environment client. at server, desktop and
  embedded use.
- `dbeaver` — SQL client software application and a database administration tool
- `entr` — Run arbitrary commands when files change
- `fq` — jq for binary formats. Decoder for inspecting binary data
- [`fx`](https://github.com/antonmedv/fx) — Terminal JSON viewer
- `git-lfs` — Git Large File Storage (LFS)
- `gitg` — GNOME GUI client to view git repositories
- `insomnia` — API Client platform for GraphQL and REST
- `jq` — Command-line JSON processor
- `lnav` — Log file viewer based on ncurses-based
- `minicom` — Friendly serial communication program
- `mysql-workbench` — MySQL Workbench is a visual database design tool
- `objdump` — Display information from object files
- `patch` — Apply a diff file to an original
- `plantuml` — Intuitive language for defining diagrams
- `postman` — API Client platform for GraphQL and REST
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) — Recursively search current
  directory for lines matching a pattern
- `scrcpy` — Display and control your Android device
- `shellcheck` — Shell script analysis tool
- `smu` — Simple markdown like syntax converter to HTML
- `usql` — Universal command-line interface for SQL databases
- `vim` — Simple text editor
- `vscode` — Visual Studio Code, open-source editor made by Microsoft
- `xxd` — Creates a hex dump of a given file or standard input
- `yq` — Command-line YAML processor - jq wrapper for YAML documents

### Virtualization

- `docker` — Docker image and container command line interface
- `libvirt` — Virtualization API for controlling virtualization engines
- `virsh` — Interface for managing virsh guest domains
- `virt-manager` — User interface for managing virtual machines
- `virtualbox-ose` — General-purpose full virtualizer for x86 hardware, targeted


### System information

- `free` — Display amount of free and used memory in the system
- `lspci` — List all PCI devices
- `lsusb` — List USB devices
- `pidof` — Find the process ID of a running program
- `ps` — Report a snapshot of the current processes.

### System tray

- [`blueman-applet`](https://github.com/blueman-project/blueman) — Blueman applet
- [`ibus`](https://github.com/ibus/ibus) — Intelligent Input Bus for Linux/Unix
- [`nm-applet`](gitlab.gnome.org/GNOME/network-manager-applet) — GUI applet to
  monitor network status and devices
- [`pasystray`](https://github.com/christophgysin/pasystray) — PulseAudio system tray

### Documents processing

- [`pdfarranger`](https://github.com/pdfarranger/pdfarranger) — PDF Merging,
  Rearranging, Splitting, and Cropping
- `libreoffice` — LibreOffice office suite
- `onlyoffice` — Office suite
- `pandoc` — Universal markup converter
- `pdftk` — A handy tool for manipulating PDF
- `smu` — Simple interpreter for a simplified markdown dialect
- `groff` — Front-end for the groff document formatting system
- `troff` — Processor of the groff text formatting system
- [`poppler-utils`](https://gitlab.freedesktop.org/poppler/poppler) — Manipulation tools
  for pdf
  - `pdfdetach` — lists or extracts embedded files (attachments)
  - `pdffonts` — font analyzer
  - `pdfimages` — image extractor
  - `pdfinfo` — document information
  - `pdfseparate` — page extraction tool
  - `pdfsig` — verifies digital signatures
  - `pdftocairo` — PDF to PNG/JPEG/PDF/PS/EPS/SVG converter using Cairo
  - `pdftohtml` — PDF to HTML converter
  - `pdftoppm` — PDF to PPM/PNG/JPEG image converter
  - `pdftops` — PDF to PostScript (PS) converter
  - `pdftotext` — text extraction
  - `pdfunite` — document merging tool

### Audio

- `alsamixer` — Graphical mixer program for the Linux Sound Architecture
- `amixer` — Command-line control of the mixer for the ALSA soundcard driver
- `audacity` — Audacity is open-source digital audio editor and recording
  application
- `pactl` — Control a running PulseAudio sound server

### Media

- `calibre` — Suite of e-book
- `gimp` — Raster graphics editor
- `imagemagick` — Suite for the creation, modification and display of bitmap
  images
- `inkscape` — Vector graphics editor
- `mpv` — Media player software based on MPlayer, mplayer2 and FFmpeg
- `sxiv` — Simple X Image Viewer
- `vlc` — Media player, supports many audio and video compression

### Networking

- `nc/netcat` — Networking utility for reading from and writing to network
  connections using TCP or UDP
- `network-manager-pptp` — PPTP support for NetworkManager
- `nmcli` — Command-line tool for controlling NetworkManager
- `nmtui` — Text User Interface for controlling NetworkManager

### Printers

- `lpq` — Show printer queue status
- `lpr` — Submits files for printing.
- `simple-scan` — Simple scanning utility
- `system-config-printer` — Graphical user interface for CUPS administration

### Processes

- `bg` — Send jobs to background
- `disown` — Remove a process from the list of jobs
- `fg` — Bring job to foreground
- `jobs` — Print currently running jobs
- `kill` — Send a signal to a process
- `nohup` — Run a command immune to hangups, with output to a non-tty

### Other

- `ar` — Create, modify, and extract from archives
- `asciiquarium` — Asciiquarium is an aquarium/sea animation in ASCII art
- `blueman` — GTK+ Bluetooth Manager
- `fc-list` — List available fonts
- `fd` — Fast and user friendly alternative to find
- `font-manager` — Simple font manager
- [`fswebcam`](https://github.com/fsphil/fswebcam) — Small and simple webcam to captured
  image
- `gdu` — Fast disk usage analyzer with console interface
- `keepassxc` — Community fork of KeePassX. A great feature is storing SSH keys
  and injection into a running ssh-agent.
- `lf` — Terminal file manager
- `linux-perf` — Performance analysis tools for Linux
- `mktemp` — Create a temporary file or directory
- `pass` — Stores, retrieves, generates, and synchronizes passwords securely
- `powertop` — Measure, explain and minimise electrical power consumption
- `type` — Display information about command type
- `util-linux` — Useful tools
- `v4l2-utils` — Userspace tools and conversion library for Video 4 Linux
- `whois` — Client for the whois directory service
- `lsof` — List open files

### Suckless

My [suckless] setup

## Resources

- <http://dotshare.it/>
- <https://github.com/alebcay/awesome-shell>
- <https://github.com/caarlos0/dotfiles.fish>
- <https://github.com/dikiaap/dotfiles>
- <https://github.com/holman/dotfiles>
- <https://github.com/inputsh/awesome-linux>
- <https://github.com/jlevy/the-art-of-command-line>
- <https://github.com/johnjago/dotfiles>
- <https://github.com/kaihendry/dotfiles>
- <https://github.com/LukeSmithxyz/voidrice>
- <https://github.com/luong-komorebi/Awesome-Linux-Software>
- <https://github.com/masasam/dotfiles>
- <https://github.com/mathiasbynens/dotfiles>
- <https://github.com/mitchweaver/dots>
- <https://github.com/mitchweaver/suckless>
- <https://github.com/rwxrob/dotfiles>
- <https://github.com/saleone/configs>
- <https://google.github.io/styleguide/shellguide.html>
- <https://jacekkowalczyk.wordpress.com/2018/11/20/how-to-install-dwm-from-suckless-org-at-fedora-29/>
- <https://johnjago.com/blog/dwm/>
- <https://suckless.org/philosophy/>
- <https://suckless.org/rocks/>
- <https://www.freedesktop.org/software/systemd/man/file-hierarchy.html>
- <https://www.reddit.com/r/unixporn/>

[suckless]: SUCKLESS.md
[hierarchy]: https://www.freedesktop.org/software/systemd/man/file-hierarchy.html
