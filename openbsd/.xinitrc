export LANG=zh_CN.UTF-8

# Fcitx
export LC_CTYPE=en_US.UTF-8
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"

exec /usr/local/bin/ck-launch-session /usr/local/bin/mate-session
