
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

export GREP_OPTIONS='-Rn --color=auto'
export EDITOR=emacs

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PATH HOME TERM

HOST=`hostname -s`
#PS1='${USER}@${HOST} $ '

PROMPT_COMMAND='res=$?;\
field_separators=3
res_len=${#res};\
padd_char="=";\
line_len=${COLUMNS:-80};\
pwd_len=${#PWD};\
line_space_left=$(($line_len - $pwd_len));\
current_date=$(date "+%Y-%m-%d_%H:%M:%S");\
current_date_len=${#current_date};\
padd_len=$(($line_len - $pwd_len - $current_date_len - $res_len - $field_separators));\
PADDING=;\
for (( i=0; i<padd_len; i++ )) ; do PADDING=${PADDING}$padd_char ; done;\
echo -e "${res} \e[1;32m${PWD}\e[0m ${PADDING} \e[4;36m${current_date}\e[0m"'

PS1='\[\e[1;31m\]${USER}\[\e[0m\]@\[\e[1;93m\]${HOST}\[\e[0m\] $ '
export PS1

