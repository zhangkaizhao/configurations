# fontconfig

## Configuration files

The `fonts.conf` can be put in `/etc/fonts/local.conf` or `$XDG_CONFIG_HOME/fontconfig/fonts.conf`.
See `man 5 fonts-conf`.

* `/etc/fonts/local.conf` for system-wide
* `$XDG_CONFIG_HOME/fontconfig/fonts.conf` for per-user

And the `conf.d/*.conf` files can be put in `/etc/fonts/conf.d/` or `$XDG_CONFIG_HOME/fontconfig/conf.d/`.

* `/etc/fonts/conf.d/` for system-wide
* `$XDG_CONFIG_HOME/fontconfig/conf.d/` for per-user

## Default fonts

* sans-serif: Open Sans
* serif: Merriweather
* monospace: Inconsolata

Notes:

1) The previous preference for sans-serif font is Lato but it is a little wider.

## CJK fonts

My preference for fallback CJK fonts is new fonts > Source Han fonts > other new fonts > WenQuanYi fonts > Arphic fonts.

See [CJK fonts](cjk-fonts.txt)

## Emoji fonts

My preference for fallback Emoji fonts is Noto Color Emoji > JoyPixels > Twemoji > Twitter Color Emoji > OpenMoji.

See [Emoji fonts](emoji-fonts.txt)

## Other notes

1) Fantasque Sans Mono uses version 1.7.2, version 1.8.0 comes with programming ligatures.
2) DejaVu fonts have some Emoji characters and should be placed after Emoji fonts.
