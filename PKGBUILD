# Maintainer: Spark <spark-aur@proton.me>
pkgname=archapt
pkgver=1.1.0
pkgrel=1
pkgdesc="For the people who forgot that they're not on Debian. Made with <3 by Spark"
arch=("any")
license=("Custom") # modified MIT, no commercial use clause added
depends=("bash" "sudo" "pacman")
conflicts=("apt") # just to be safe lol
provides=("apt") # no shit sherlock
source=("$pkgname.sh" "LICENSE")
sha256sums=('9ca106d1a83fb8bbff84a206696844897c17513ff10d0f5b92d6cc86abcc1f7d'
            '7d58c0581544a88060b883012151056fb309da2dc74eaa2ee5de2b57c0897029')

package() {
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/apt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
