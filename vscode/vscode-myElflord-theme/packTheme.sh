#!/usr/bin/env bash

echo "To install the theme go to File->Preferences->Extensions"
echo "In the upper right corner of the list of extnsions, click on the three dots '...'"
echo "Select install from .vsix and choose the path to the zip archive"

zip -r myElflord.vsix '[Content_Types].xml' extension extension.vsixmanifest


