# .bashrc
# this file clone

# modifications needed only in interactive mode
if [ "$PS1" != "" ]; then
    # Set default editor for git
    git config --global core.editor /usr/bin/nano

    # Turn on checkwinsize
    shopt -s checkwinsize

    # keep more history
    shopt -s histappend
    export HISTSIZE=100000
    export HISTFILESIZE=100000
    export PROMPT_COMMAND="history -a;"

    # Source for Git PS1 function
    git_type=$(type -t __git_ps1)
    if [ -z $git_type ] && [ -e "/usr/share/git-core/contrib/completion/git-prompt.sh" ]; then
        . /usr/share/git-core/contrib/completion/git-prompt.sh
    fi

    # Cloud9 default prompt
    _cloud9_prompt_user() {
        if [ "$C9_USER" = root ]; then
            echo "$USER"
        else
            echo "$C9_USER"
        fi
    }

    git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    git_color() {
        [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 31 || echo 33
    }

    # PS1='\[\033[01;32m\]$(_cloud9_prompt_user)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)" 2>/dev/null) $ '
    #PS1="╭─○ \[\033[01;32m\]${C9_USER}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")╰─○ "
    PS1="╭─○ \[\033[\$(git_color)m\]\$(git_branch)\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")
╰─○ "
fi

