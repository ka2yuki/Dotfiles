# echo " nvm is not suppurt fish."

fisher install jorgebucaran/fish-nvm
nvm install 14.16.0
echo "nvm install stable"
nvm install lts

# document 
# https://github.com/jorgebucaran/nvm.fish


eval "(rbenv init -)"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$PATH:/usr/local/bin/yarn"
echo $PATH


#　テーマ
set fish_theme agnoster
