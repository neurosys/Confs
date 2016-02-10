# Path to your oh-my-zsh installation.
export ZSH=/home/camza/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="bira"
#ZSH_THEME="bureau"
ZSH_THEME="rkj-repos"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git zsh-syntax-highlighting colored-man-pages colorize rand-quote cp sudo k vim-interaction calc)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

path_to_conf_folder=$( readlink -f ~/.zshrc )

if [ -f ${path_to_conf_folder}/envtests ]
then
    . ${path_to_conf_folder}/envtests
fi

if [ -f ${path_to_conf_folder}/defines ]
then
    . ${path_to_conf_folder}/defines
fi

if [ -f ${path_to_conf_folder}/exports ]
then
    . ${path_to_conf_folder}/exports
fi

if [ -f ${path_to_conf_folder}/aliases ]
then
    . ${path_to_conf_folder}/aliases
fi

if [ -f ${path_to_conf_folder}/.local_aliases ]
then
    . ${path_to_conf_folder}/.local_aliases
fi

alias ds30me='sshpass -p salutare ssh camza@77.81.122.58'
alias ttyds='sudo minicom --baudrate 115200 --device /dev/ttyUSB1 --color=on'
alias ttyv2='sudo minicom --baudrate 38400  --device /dev/ttyUSB0 --color=on'
alias terms="lsof /dev/pts/* | grep -v NAME | tr -s ' ' | cut -d' ' -f9 | sort -u"


. ~/.oh-my-zsh/plugins/z/z.sh
