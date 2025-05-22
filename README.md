# archapt
for the people who are too stupid to realize that arch's package manager is pacman, not apt

**DISCLAIMER**: This bash script just converts `apt` commands to `pacman` commands. Don't get it twisted, `apt` wasn't actually ported to Arch.

## EXAMPLE USAGE
assuming you're using the package,
```bash
sudo apt install neofetch
```
```bash
sudo apt install neofetch --noconfirm --noupgrade
```
```bash
sudo apt install neofetch --dry-run
```
**NOTE**: archapt doesn't need to be run with `sudo`, but internally it uses pacman which *does* need to be run with `sudo`.

if you're using the script, then instead of `apt` type `./archapt` or whatever you saved as the script.

## SUPPORTED COMMANDS
- `install`
- `remove` or `autoremove` (`autoremove` isn't necessary lol, pacman handles dependencies better)
- `search`
- `upgrade`
- `update`
- `list`
- `info`

maybe don't try to run `apt moo`.

**Flags**

- `--noconfirm`: Skips the script and pacman's confirm prompts.
- `--noupgrade`: Uses `-S` instead of `-Syu`. Can't be used with `--update`.
- `--update`: Uses `-Sy` instead of `-Syu`. Can't be used with `--noupgrade`.
- `--dry-run`: Doesn't *actually* run the pacman command and just translates it directly. It's only there for your self-esteem.

## INSTALLATION (AUR)
coming soon™

## INSTALLATION (manual)
### Package (.pkg.tar.xz)
#### Building from Source
**Dependencies:**
- Arch or any Arch-based Linux distro (duh)
- base-devel (install with sudo pacman -S --needed base-devel)
This doesn't work on WSL, because there's no `systemd`.
  
**Instructions**

Open up the terminal, then clone the repo:
```bash
git clone https://github.com/sparkhere-sys/archapt.git
```
`cd` to the directory with the cloned repo. Run:
```bash
makepkg -si
```
...which automatically builds and installs archapt.

If for whatever reason it doesn't work, move `archapt.sh` from the `script/` directory and put it with the PKGBUILD.

#### Local Package
run:
```bash
sudo pacman -U (replace this with the package path)
```

### Script
just download it and put it wherever you want, then run this command:

```bash
chmod +x archapt.sh
```
...which makes it executable. if you put it in /usr/bin/ or any protected directory, use `sudo`.

### Binary
if you want to mimic `apt`, do these commands:

```bash
cd /usr/bin
sudo touch apt
sudo chmod +x apt
```

open `apt` with your chosen text editor (use `sudo` or else you'll be stuck in readonly mode)

copy the script you downloaded and paste it into the file, then save.
