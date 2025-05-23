# Maintainer: Spark <spark-fr@outlook.com>
pkgname=archapt
pkgver=1.1.0
pkgrel=1
pkgdesc="For the people who forgot that they're not on Debian. Made with <3 by Spark"
arch=('any')
license=('MIT')
depends=('bash')
conflicts=('apt') # just to be safe lol
provides=('apt') # hehe
source=('script/archapt.sh')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/script/archapt.sh" "$pkgdir/usr/bin/apt"
}
