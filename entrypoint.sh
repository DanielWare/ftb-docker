#!/bin/sh

# Check if the required environment variable is set
if [ -z "$MOD_PACK_ID" ]; then
  echo "Please set the MOD_PACK_ID environment variable"
  exit 1
fi

# Set the VERSION_ARG to "--latest" if not provided
if [ -n "$VERSION_ID" ]; then
  VERSION_ARG="$VERSION_ID"
else
  echo "VERSION_ID not set, using latest"
  VERSION_ARG="--latest"
fi

# Check if this is the first install or force-update
if [ ! -e "/ftb/.installed" -o -n "$FORCE_UPDATE" ]; then
  echo "Running Installer"
  "/ftb/server_installer" "$MOD_PACK_ID" "$VERSION_ARG" --auto && touch "/ftb/.installed"
fi

sh "/ftb/start.sh"
