# Path to your oh-my-zsh installation.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

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
#HIST_STAMPS="yyyy-mm-dd"



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"


path_to_conf_folder=$( readlink -f ~/.zshrc )
modules_folder=$(dirname $path_to_conf_folder)


if [ -f ${modules_folder}/envtests ]
then
    . ${modules_folder}/envtests
fi

if [ -f ${modules_folder}/defines ]
then
    . ${modules_folder}/defines
fi

if [ -f ${modules_folder}/exports ]
then
    . ${modules_folder}/exports
fi

if [ -f ${modules_folder}/aliases ]
then
    . ${modules_folder}/aliases
fi


if [ -f ${modules_folder}/.local_aliases ]
then
    . ${modules_folder}/.local_aliases
fi

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${modules_folder}/zsh/

#ZSH_THEME="agnoster"
#ZSH_THEME="bira"
#ZSH_THEME="bureau"
#ZSH_THEME="rkj-repos"
#ZSH_THEME="amuse"
#ZSH_THEME="arrow"
#ZSH_THEME="blinks"
    #ZSH_THEME="candy"
    #ZSH_THEME="darkblood"
if [[ $is_cygwin -eq 1 ]]
then
    plugins=(git zsh-syntax-highlighting colored-man-pages colorize cp k)
    #ZSH_THEME="cypher"
    #ZSH_THEME="evan"
    #ZSH_THEME="dstufft"
    #ZSH_THEME="flazz"
    #ZSH_THEME="fox"
    ZSH_THEME="fox"
else
    #ZSH_THEME="rkj-repos"
    ZSH_THEME="fox"
    plugins=(git zsh-syntax-highlighting colored-man-pages colorize rand-quote cp sudo k vim-interaction calc)
fi

DISABLE_AUTO_UPDATE="false"
export ZSH=${modules_folder}/zsh/oh-my-zsh
source $ZSH/oh-my-zsh.sh

alias ds30me='sshpass -p salutare ssh camza@77.81.122.58'
alias ttyds='sudo minicom --baudrate 115200 --device /dev/ttyUSB1 --color=on'
alias ttyv2='sudo minicom --baudrate 38400  --device /dev/ttyUSB0 --color=on'
alias terms="lsof /dev/pts/* | grep -v NAME | tr -s ' ' | cut -d' ' -f9 | sort -u"


#. ~/oh-my-zsh/plugins/z/z.sh
. $ZSH/plugins/z/z.sh
