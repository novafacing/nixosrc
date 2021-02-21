xprop -id `xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | awk '{print $5}'` | grep "WM_CLASS(STRING)" | sed -e 's/.*= "\([^"]*\)".*/\1/'
