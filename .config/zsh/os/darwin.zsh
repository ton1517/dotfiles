# see https://takazudomodular.com/pj/zpaper/articles/universal-clipboard-not-syncing-fix/
fix_clipboard() {
  sudo killall -HUP bluetoothd
  sudo killall -HUP sharingd
  sudo killall -HUP pboard
  echo "bluetoothd, sharingd, pboard restarted"
}
