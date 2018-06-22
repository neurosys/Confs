#!/bin/bash

# XXX Let's assume that cygwin's setup executable is already placed at /

# -q quiet mode
# -d No desktop shortcut
# -P <packets>
/setup-x86_64.exe -d -P $(cat basic_packages.txt)


