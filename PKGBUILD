# Maintainer: Spark <spark-fr@outlook.com>
pkgname=archapt
pkgver=1.1.0
pkgrel=1
pkgdesc="for the people who are too stupid to realize that arch's package manager is pacman, not apt. made with <3 by Spark"
arch=('any')
license=('MIT')
depends=('bash')
source=('archapt.sh')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/archapt.sh" "$pkgdir/usr/bin/apt"
}
