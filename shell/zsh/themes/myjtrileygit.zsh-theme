function retcode() {}

#$# $(git_current_branch)
#$# $(git_prompt_short_sha)
#$# $(git_prompt_status)
#$# $(git_prompt_info)
#$# $(parse_git_dirty)

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_UNTRACKED="???"

# Checks if working tree is dirty
function parse_git_dirty() 
{
	local STATUS
	local -a FLAGS
	FLAGS=('--porcelain' '--ignore-submodules=dirty' '--untracked-files=no')
	if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
		STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
	fi

	if [[ -n $STATUS ]]; then
		echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
	else
		echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
	fi
}


function my_git_info()
{
    local branch=$(git_current_branch)
    if [[ -n $branch ]]
    then
        echo "%{$reset_color%}%{$fg[white]%}% $(git_current_branch)%{$fg[cyan]%}[%{$fg[white]%}$(git_prompt_short_sha)%{$fg[cyan]%}] $(parse_git_dirty)%{$reset_color%}"
    else
        echo ""
    fi
}

function my_kubernetes()
{
    ctx=$(kubectl config current-context)
    ns=$(kubens -c)
    if [[ -n $ctx ]]
    then
        echo "%{$fg[cyan]%}%{$bg[black]%}<$ctx:$ns>%{$reset_color%}"
    fi
}

PROMPT='%{$fg_bold[white]%}%?$(retcode) %{$fg_bold[cyan]%}%D{%H:%M:%S}%{$fg_bold[green]%} %{$fg_bold[white]%}%n%{$fg[magenta]%}@%{$fg_bold[white]%}%m %{$fg_bold[green]%}%d $(my_git_info) $(my_kubernetes)
%{$fg_bold[yellow]%}%% %{$reset_color%}'


