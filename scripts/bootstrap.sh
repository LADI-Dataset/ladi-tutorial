
#!/bin/sh

# script/bootstrap: 
# Resolve all dependencies that the application requires to run.
# This can mean packages, software language versions, Git submodules, etc.
# The goal is to make sure all required dependencies are installed.

# unzip to extract zip archives
apt install unzip

## Check for $FLOOD_ANALYSIS_CORE
# https://stackoverflow.com/q/3601515
if [ -z "${FLOOD_ANALYSIS_CORE:-}" ]; then echo "FLOOD_ANALYSIS_CORE is set to '$FLOOD_ANALYSIS_CORE'"; else echo "FLOOD_ANALYSIS_CORE is unset"; fi
