# - fish cmd exist? check!
# fish_config > /dev/null 2>&1
# fi
echo "======================================="
echo "🔎 Check fish🐠.. "
echo "======================================="
# if type '$(which fish)' > /dev/null 2>&1; then
# なぜか上記では 
if [ -e "$(which fish)" ]; then
  echo $(which fish >&1)
  # 上記説明
  # ( )	コマンドをグループ化
  echo "✅ Exist! FISH" #コマンドが存在する時の処理
  chsh -s $(which fish) 
  sleep 3
  # FISH=$(which fish)
  # echo `/usr/local/bin/fish`
  # echo $SHELL
  # echo $FISH
  # echo $($SHELL -eq $FISH)
  # if test ! $($SHELL!=$FISH); then
  # fi
  # echo 'fish処理完了!!🎉'
else
  echo $(which fish >&2)
  echo "🐷 NOT Exist! fish_config.. 🐷" #コマンドが存在しないときの処理
  brew install fish
  echo `fish`
  echo 'fish処理完了!!🎉' 
  sleep 3
fi

echo "======================================="
echo "fish config setup"
echo "======================================="

################
# fish config
################
# ln -sf ${PWD}/fish/config.fish ${HOME}/.config/fish/config.fish
# echo "🔎 Check DIR ~/.config/fish/conf.d"
# if [ -e ${HOME}/.config/fish/conf.d ]; then
#   ln -sf ${PWD}/fish/alias.fish ${HOME}/.config/fish/conf.d/alias.fish
# else
#   mkdir ${HOME}/.config/fish/conf.d
#   ln -sf ${PWD}/fish/alias.fish ${HOME}/.config/fish/conf.d/alias.fish
# fi
# ln -sf ${PWD}/fish/fish_prompt.fish ${HOME}/.config/fish/functions/fish_prompt.fish
# ln -sf ${PWD}/fish/.fish_user_key_bindings.fish ${HOME}/.config/fish/functions/fish_user_key_bindings.fish
###################
# fish config END #
###################


# if [ $? -eq 127 ]; then
#   echo "Exist! FISH" 
# else
#   echo "NOT exist!"
#   brew install fish
# fi
echo "🔎 Now Check git.io/fisher"
echo "======================================="
echo "this's Fisher Extention-Management-Tool."
sleep 3
# install fisher for fish extention management tool.
if [ -e "$HOME/.config/fish/functions/fisher.fish" ]; then
  echo "✅ Exist! functions/fisher.fish" 
else
  echo "🐖 \".. NOT exist! functions/fisher.fish" 
  sleep 1
  echo 🐷
  sleep 1
  echo 🐽
  sleep 1
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fi




# chsh -s /bin/zsh
# chsh -s /bin/bash
echo "###########################"
echo "## HOW TOO CUSTOM 'FISH' ##"
echo "###########################"
# OPEN at Browser         
# When press below command..   
#
# > $ fish_config
echo "--------------"
echo "omy install.." # https://github.com/oh-my-fish/oh-my-fish
echo "--------------"
sleep 3
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf


## vim plug setting
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

omf install rbenv
## VimにPowerlineの　fish版です。
fisher add oh-my-fish/theme-bobthefish



# =======================================
# =========== よくわからない ==============
# =======================================
# echo -e "\e[36;40;4m下線つき\e[m"
# \e[ : start
# color;background;style(underbar etc.)
# m   : end
COLOR_0="\e[36;41;4m"
COLOR_1="\e[36;4m"
COLOR_OFF="\e[m\n"
bold=$(tput bold)
normal=$(tput sgr0)
# echo "${COLOR_1}"
# echo "${COLOR_1}hoge${COLOR_OFF}"
printf "${COLOR_1}hoge${COLOR_OFF}"
# =======================================


########################################
# fish の　テーマを当てるため。 powerLine
########################################
echo "======================================="
echo "powerline install at ~/fonts"
echo "======================================="
cd $HOME
# 文字化け 改善
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd $HOME/fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
echo "ここにある."
ls /Users/$USER/Library/Fonts 
sleep 3
echo "==========================="
echo "使用できる PowerLine fonts."
echo "==========================="
sleep 2 
ls /Users/o/Library/Fonts |grep Powerline
echo "上記のフォントを使っているターミナルに設定しfish用にPowerLineを設定してください。"


sleep 5

echo "==================="
echo "PLEASE type 'fish'"
echo "==================="
echo 