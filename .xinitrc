xrdb -merge ~/.Xresources
export OPERAPLUGINWRAPPER_PRIORITY=0
export OPERA_KEEP_BLOCKED_PLUGIN=0
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export LC_CTYPE=zh_CN.utf8
#exec ck-launch-session dbus-launch /usr/bin/wmii
xmodmap ~/.xmodmap
wmii 
#gnome-session
