#!/bin/bash
# Setup XFCE desktop + VNC + noVNC in GitHub Codespaces with auto password and Minetest launch

# Update packages
sudo apt update

# Install XFCE desktop environment
sudo apt install -y xfce4 xfce4-goodies

# Install TigerVNC server
sudo apt install -y tigervnc-standalone-server tigervnc-common

# Install noVNC (browser-based VNC client)
sudo apt install -y novnc websockify

# Create VNC password file automatically
mkdir -p ~/.vnc
echo "gatisterrydavis1234567890" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Start VNC server on display :1
vncserver :1 -xstartup /usr/bin/startxfce4 -geometry 1280x800 -depth 24

# Start noVNC on port 6080 (web access)
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &

bash start-minetest.sh