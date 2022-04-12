# !/bin/bash
# =======================================
# OS 別の設定
echo '---------'
echo $OSTYPE
echo '---------'
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        # ! 面倒なので、update は 無闇に行わない。
        if type 'brew upgrade' > /dev/null 2>&1; then
          brew upgrade
        else
          echo 'not brew running..'
        fi

        export CLICOLOR=1
        alias ls='ls -a -G -F'
        # local SETTINGS The VSCode.settings and Markdwon.css to SAME GIT-REPO
        # ln -fnsv ${PWD}/VSCode/settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json
        # ln -fnsv ${PWD}/md_preview.css ${HOME}/Library/Application\ Support/Code/User/md_preview.css
        ;;
    linux*)
        #Linux用の設定
        yum update -y
        alias ls='ls -a -F --color=auto'
        # if test "$(whoami)" = "root"
        # then
        #   echo "🚨 is root user.🚨"
        #   yum update-minimal
        #   adduser dev
        #   echo "== Swhich USER. to dev. =="
        #   su - dev
        #   exit
        # fi
        ;;
esac
# 作業ユーザー削除
# userdel -r dev

# =======================================
# DOCER
# =======================================
# git clone

# Docker-Compose INSTALL
# sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# プロジェクトのビルド
# docker-compose run web rails new . --force --database=postgresql
# DOCUMENT: https://docs.docker.jp/compose/rails.html



ln -sf ${PWD}/zsh/.zsh_profile ${HOME}/.zsh_profile
ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
ln -sf ${PWD}/bash/.bash_profile ${HOME}/.bash_profile
ln -sf ${PWD}/bash/.bashrc ${HOME}/.bashrc
ln -sf ${PWD}/bash/.bashrc.alias ${HOME}/.bashrc.alias
ln -sf ${PWD}/.vimrc ${HOME}/.vimrc
ln -sf ${PWD}/.sqliterc ${HOME}/.sqliterc




echo "======================================="
echo "rbenv install"
echo "======================================="
sleep .2
if type 'rbenv' > /dev/null 2>&1; then
  echo '✅ Exist! .rbenv cmd.'
  sleep .3
else
  brew install rbenv
  # brew upgrade rbenv ruby-build
  rbenv init

  # git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  # cd ~/.rbenv && src/configure && make -C src
  echo "When not throgh PATH."
  # export PATH=$PATH:追加するディレクトリ名
  # echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile 
  echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> $HOME/.bash_profile 
  echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> $HOME/.zsh_profile 
  echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile
  echo 'eval "$(rbenv init -)"' >> $HOME/.zsh_profile
  echo 'eval "$(rbenv init -)"' >> $HOME/.zshrc
  # 上記 .bash_profile に追記したモノを 更新させる。
  source $HOME/.bash_profile
  source $HOME/.zsh_profile
  source $HOME/.zshrc
  # echo 'eval "$(rbenv init -)"' >> ~/.bash_profile 
  # or
  # eval "$(rbenv init -)"

  echo '!!Check rbenv with rbenv-docker..'
  echo "----------------------------------"
  sleep 2
  echo '.'
  sleep 2
  echo '.'
  sleep 2
  echo '.'
  sleep 2
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
  echo "------------------------------"
  echo "list latest stable versions:"
  echo "------------------------------"
  rbenv install -l

  echo "✅ rbenv install done."
  echo "Use rbenv install [ver] && rbenv versions"
  rbenv versions
  echo "------------------------------"
  ruby -v
  echo "🎉 ruby installed by rbenv. 🎉"
  sleep 3
  exit


  # ++++++++++++++++++++
  # GIT install version | not used.
  # ++++++++++++++++++++
  # Install ruby-build, which provides the rbenv install command that simplifies the process of installing new Ruby versions.
  source ~/.bash_profile
  # 5. 🔎 Verify that rbenv is properly set up using this rbenv-doctor script:
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
  rbenv install --list
  rbenv install 2.7.2
  rbenv versions
  rbenv use 2.7.2
  eval "$(rbenv init -)"
  # or
  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
  source ~/.bash_profile
  # When not available `rbenv install`, install plugin ruby-build.
  # As an rbenv plugin
  # https://github.com/rbenv/ruby-build#installation
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi


echo "======================================="
echo "GIT INSTALL"
echo "======================================="
if type 'git' > /dev/null 2>&1; then
  echo '✅ Exist! git cmd.'
else
  OLD_GIT_VER=`git --version`
  yum -y install gcc curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker autoconf
  # インストールに適切な場所に移動
  cd /usr/local/src/
  # サイトから Git の圧縮ファイルをダウンロード
  # 最新 Version はこちらでチェック。https://www.kernel.org/pub/software/scm/git/
  wget https://www.kernel.org/pub/software/scm/git/git-2.29.2.tar.xz
  # tar にする. .xzが付与されいるので.
  mv git-2.29.2.tar.xz git-2.29.2.tar
  # 解凍する
  tar xvf git-2.29.2.tar
  # 解凍した Git ディレクトリに移動
  cd git-2.29.2/
  # make コマンドでインストール
  make prefix=/usr/local all
  make prefix=/usr/local install

  # バージョン確認コマンド
  echo NEW:$(git --version), OLD:$OLD_GIT_VER
fi


# =======================================
# echo "🔎 Check Brew🍺 now"
# sleep 1
# echo 🐣
# sleep .3
# echo .
# sleep .3
# echo .
# sleep 1
# echo 🐥
# sleep .3
# echo .
# sleep .3
# echo .
# sleep 1
# echo "======================================="
# if type "brew" > /dev/null 2>&1; then
#   echo "Exist! brew ✅" #コマンドが存在する時の処理
# else
#   echo "NOT exist Brew!" #コマンドが存在しないときの処理
#   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
# fi


# Check for Homebrew
# if test ! $(which brew)
# then
#   echo "🐽 NOT exist Brew!" #コマンドが存在しないときの処理
#   echo "  Installing Homebrew for you."
#   # Install the correct homebrew for each OS type
#   if test "$(uname)" = "Darwin"
#   then
#     /bin/bash cd $HOME && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#     sleep 1
#     echo 🐓
#     sleep .3
#     echo .
#     sleep .3
#     echo .
#     sleep .3
#     echo 🍗
#     sleep 1
#     echo "🎉 Installed! Brew🍺 " #コマンドが存在する時の処理
#     sleep 1
#   elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
#   then
#     /bin/bash cd $HOME && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#     sleep 1
#     echo 🐓
#     sleep .3
#     echo .
#     sleep .3
#     echo .
#     sleep .3
#     echo 🍗
#     sleep .3
#     echo .
#     sleep 1
#     echo "🎉 Installed! Brew🍺 " #コマンドが存在する時の処理
#     sleep 1
#   fi
# fi


# Other
# ln -sf ${PWD}/Desktop/Dotfile/.gitconfig ${HOME}/.gitconfig
cp ${PWD}/.gitconfig ${HOME}/.gitconfig
# sudo cp ${PWD}/hosts ${HOME}/etc/hosts
# ln -sf ${PWD}/com.googlecode.iterm2.plist${PWD} 




# fish cmd exist? check!
# fish_config > /dev/null 2>&1
# fi
echo "======================================="
echo "🔎 Check fish🐠.. "
echo "======================================="
# if type '$(which fish)' > /dev/null 2>&1; then
# なぜか上記では 
if [ -e "$(which fish)" ]; then
  echo $(which fish >&1)
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




echo "====================="
echo "🔎 Node.js chack.."
echo " tips nvm は 公式には掲載されなくなっていました。2021/08/16."
echo "====================="
sleep 3
# node -v &> /dev/null
# if [ $? -ne 0 ]; then
if type "node -v" > /dev/null 2>&1; then
  echo "🐖\".. NOT exist! Node.js"
  # brew install node
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  nvm install stable
  echo "doc : https://github.com/nvm-sh/nvm"
else
  echo "✅ Exist! Node.js" 
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


echo "======================================="
echo "Theme 'DRACULA️🧛' ️install for Hyper.app"
echo https://draculatheme.com/
printf "${COLOR_1}https://draculatheme.com/${COLOR_OFF}"
echo "======================================="
# Theme "DRACULA🧛🏻‍" INSTALL🎉:: https://draculatheme.com/
git clone https://github.com/dracula/iterm.git
# to hyper
hyper install hyper-dracula
# ADD cmd+. , Type to Fonts NAME!!



echo "======================================="
echo "Fonts install 白玄"
printf "https://github.com/yuru7/HackGen/"
echo "======================================="
if [ -e "$HOME/Library/Fonts/Hack-Bold.ttf" ]; then
  echo "Exist Hack fonts."
else
  echo "Not Exist Hack fonts."
  brew cask install font-hackgen-nerd
  brew cask install font-hackge
  brew tap homebrew/cask-fonts
fi

for i in `seq 5`
do
  echo .
done
echo "==================="
echo "PLEASE type 'fish'"
echo "==================="
echo 
echo 
echo "Done!!🎉"
echo 
echo 
