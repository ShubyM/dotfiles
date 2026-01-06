#source ~/.bash_profile


export CLICOLOR=1
alias ls='ls -G'

export EDITOR='vim'
export CLICOLOR=1
export PATH=/opt/homebrew/bin:$PATH

autoload -U colors && colors
PROMPT="shuby %{$fg[red]%}:%{$fg[red]%}: %{$fg[green]%}%~ %{$fg[blue]%}»%{$reset_color%} "

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

export JAVA_HOME="/opt/homebrew/opt/openjdk@17/"

# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Users/shuby/.local/bin:$PATH"
export PATH="/Users/shuby/.cargo/bin:$PATH"


# bun completions
[ -s "/Users/shuby/.bun/_bun" ] && source "/Users/shuby/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/openldap/bin:$PATH"
export PATH="/opt/homebrew/opt/openldap/bin:$PATH" export PATH="/opt/homebrew/opt/openldap/bin:$PATH"
export PATH="/opt/homebrew/opt/openldap/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/shuby/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"


export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
