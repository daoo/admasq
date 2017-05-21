pkgname=admasq
pkgver=1.0
pkgrel=1
pkgdesc="Automatic blocklist updating for dnsmasq."
url="http://github.com/daoo/admasq"
arch=('any')
depends=('python' 'python-requests' 'systemd' 'dnsmasq')
makedepends=()
source=('admasq' 'admasq.conf' 'admasq@.service' 'admasq@.timer' 'sources.list' 'whitelist.list')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package()
{
  install -Dm755 "admasq" "$pkgdir/usr/bin/admasq"
  install -Dm644 "admasq@.service" "$pkgdir/usr/lib/systemd/system/admasq@.service"
  install -Dm644 "admasq@.timer" "$pkgdir/usr/lib/systemd/system/admasq@.timer"
  install -Dm644 "admasq.conf" "$pkgdir/var/lib/admasq/admasq.conf"
  install -Dm644 "sources.list" "$pkgdir/etc/admasq/sources.list"
  install -Dm644 "whitelist.list" "$pkgdir/etc/admasq/whitelist.list"
}

# vim:set ts=2 sw=2 et:
