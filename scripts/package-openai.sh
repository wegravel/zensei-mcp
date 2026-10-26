#!/bin/sh
# Builds the ZIP for the ChatGPT plugin directory (platform.openai.com/plugins).
# The ZIP holds the manifest, the MCP config and the icons. Never add
# credentials: reviewer logins go in the portal, under Review details.
set -eu
cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/zensei-chatgpt.zip
zip -q -X dist/zensei-chatgpt.zip plugin.json mcp.json assets/icon.png assets/logo.png
unzip -l dist/zensei-chatgpt.zip
