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
sha256sums=('f804fb75e2cc3b3aa6254817f4560f3f69ede0ed0adf3b2aa38180d44e8adc01'
            '7d58c0581544a88060b883012151056fb309da2dc74eaa2ee5de2b57c0897029')

package() {
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/apt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
