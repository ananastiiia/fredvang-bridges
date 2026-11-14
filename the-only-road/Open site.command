#!/bin/bash
# Double-click to view the site on this Mac (needs Node.js or Python 3).
cd "$(dirname "$0")" || exit 1
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
if command -v node >/dev/null 2>&1; then
  exec node .serve.mjs
elif command -v python3 >/dev/null 2>&1; then
  (sleep 1; open "http://localhost:5173/") &
  echo "The Only Road is running at http://localhost:5173/ — close this window to stop."
  exec python3 -m http.server 5173 --bind 127.0.0.1 --directory site
else
  echo "Install Node.js (nodejs.org) to view the site locally, or upload the 'site' folder to a host."
  read -r -p "Press Enter to close."
fi
