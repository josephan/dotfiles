
if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    # Set colors for prompt
    set_color $fish_color_cwd

    # Show the full path of the current directory
    echo -n (pwd)

    # Reset colors
    set_color normal

    # Add the '$' symbol and a space after the directory path
    echo -n ' $ '
end

alias rasm="cd /d/UnityGames/RobotAssembly2022"

# install fisher: https://github.com/jorgebucaran/fisher

# install plugins:

# jorgebucaran/fisher
# jethrokuan/fzf
# jhillyerd/plugin-git 
# fisher install jethrokuan/z
set -U Z_CMD "j"

# Windows Terminal Fish Config:
# {
#     "colorScheme": "One Half Dark",
#     "commandline": "C:\\msys64\\msys2_shell.cmd  -defterm -here -no-start -ucrt64 -use-full-path -shell fish",
#     "guid": "{1499db3f-39bd-4c38-956a-e2b7c127ae6d}",
#     "hidden": false,
#     "icon": "C:\\Users\\Joseph\\Pictures\\favicon.ico",
#     "name": "Fish",
#     "startingDirectory": "%USERPROFILE%"
# }
