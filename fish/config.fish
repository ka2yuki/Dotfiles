export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "(rbenv init -)"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$PATH:/usr/local/bin/yarn"
echo $PATH


#　テーマ
set fish_theme agnoster
