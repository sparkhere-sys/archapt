# archapt
for the people who are too stupid to realize that arch's package manager is pacman, not apt

**DISCLAIMER**: This script just converts APT commands to pacman commands. Don't get it twisted, APT wasn't actually ported to Arch, as cool as that might be.

## SUPPORTED COMMANDS
- install
- search
- upgrade
- update

## INSTALLATION (AUR)
coming soon™

## INSTALLATION (manual)
### Package (.pkg.tar.xz)
coming soon™

### Script
just download it and put it wherever you want. run this command:

```bash
chmod +x archapt.sh
```

### Binary
do these commands:

```bash
cd /usr/bin
sudo touch apt
chmod +x apt
```

open `apt` with your chosen text editor

copy the script you downloaded and paste it into the file, then save

from there, you can run any of the supported commands! easy as that.
