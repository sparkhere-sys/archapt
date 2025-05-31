# Maintainer: Spark <spark-aur@proton.me>
pkgname=archapt
pkgver=1.1.0
pkgrel=1
pkgdesc="For the people who forgot that they're not on Debian. Made with <3 by Spark"
arch=('any')
license=('Modified-MIT')
depends=('bash') # holy shit no way
conflicts=('apt') # just to be safe lol
provides=('apt') # hehe
source=("script/$pkgname.sh" "LICENSE.md")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/script/archapt.sh" "$pkgdir/usr/bin/apt"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
