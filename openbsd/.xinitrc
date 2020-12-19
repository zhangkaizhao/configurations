export LANG=zh_CN.UTF-8

# Fcitx
export LC_CTYPE=en_US.UTF-8
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"

#exec /usr/local/bin/ck-launch-session /usr/local/bin/mate-session

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
  eval `dbus-launch --sh-syntax --exit-with-session`
fi
/usr/local/bin/startlxqt
