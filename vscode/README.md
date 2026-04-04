
Path for settings.json ~/.config/Code/User/settings.json
Path for keybindings.json ~/.config/Code/User/keybindings.json

Path for c_cpp_properties.json **my-project-folder**/.vscode/c_cpp_properties.json


## On MacOS
From terminal in case holding a key down opens a pop-up with unicode characters,
run this from the terminal:
`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`

To set it back, use:
`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool true`
