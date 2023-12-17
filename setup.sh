#!/bin/bash
echo "Starting up"
pip3 install -r ./requirements.txt
echo "#!/usr/bin/env python3" > kareena.command
cat kareena.py  >> ./kareena.command
chmod +x ./kareena.command
./kareena.command https://open.spotify.com/playlist/0LGQHvz8P2AXKlgE7N1Gfv
