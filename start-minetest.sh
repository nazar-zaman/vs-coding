#!/bin/bash

# Kill old VNC session
vncserver -kill :1 2>/dev/null

# Start new VNC session with XFCE
vncserver :1 -xstartup /usr/bin/startxfce4 -geometry 1280x800 -depth 24

# Kill any old websockify proxy
pkill -f websockify

# Start noVNC proxy on port 6080
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &

echo "✅ VNC server and noVNC proxy started."
echo "🌐 Open your browser to the forwarded port 6080 and click Connect, by going to the PORTS tab on terminal, going to port 6080 and pressing Ctrl + Click on the URL."
echo "🕹️ Once inside the link, connect to the noVNC server by pressing Connect, then typing in the password. Once inside the desktop, open a terminal by pressing Applications in the top left, and pressing Terminal Emulator. Then, run:"
echo "   << ./bin/minetest >> in the <<>> quotation marks to run minetest."
echo "#NOTE: you cannot look up and down without a mouse. :("
