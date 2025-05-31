# archapt
for the people who are too stupid to realize that arch's package manager is pacman, not apt

AUR support will not be added, just use [wahoo](https://github.com/sparkhere-sys/wahoo).

this doesn't work on `wsl`. don't try it.

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
- `remove`, `autoremove`, or `uninstall` (`autoremove` isn't necessary lol, pacman handles dependencies better)
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
- `--dont-remove-depends`: Uses `-R` instead of `-Rns`.

## INSTALLATION (AUR)
coming soon™

not on the AUR yet :(

## INSTALLATION (manual)
### Package (.pkg.tar.xz)
#### Building from Source (recommended)
**Dependencies:**
- Arch or any Arch-based Linux distro (duh)
- base-devel (install with sudo pacman -S --needed base-devel)
  
**Instructions**

Open up the terminal, then clone the repo:
```bash
git clone https://github.com/sparkhere-sys/archapt.git
```
`cd` to the directory with the cloned repo.

Run:
```bash
makepkg -si
```
...which automatically builds and installs archapt.


#### Local Package
run:
```bash
sudo pacman -U /path/to/your/archapt-X.X.X-1-any.pkg.tar.zst
```

### Script
just download it and put it wherever you want, then run this command:

```bash
chmod +x archapt.sh
```
...which makes it executable. if you put it in /usr/bin/ or any protected directory, use `sudo`.

### Binary
for the love of all things holy, DO NOT do this on a debian based distro. this will overwrite `apt` if it exists.

download 

do these commands:

```bash
sudo cp /path/to/your/archapt.sh /usr/bin/apt
sudo chmod +x /usr/bin/apt
```

you don't have to name it `apt`, but it is recommended.

### Binary (but the dumb way)
run:
```bash
cd /usr/bin/
sudo touch apt
```

copy the script you downloaded, then paste everything into `apt`.
