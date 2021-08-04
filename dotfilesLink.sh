# !/bin/bash
# =======================================
# OS 別の設定
echo $OSTYPE
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
        ln -fnsv ${PWD}/settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json
        ln -fnsv ${PWD}/md_preview.css ${HOME}/Library/Application\ Support/Code/User/md_preview.css
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



echo "======================================="
echo "RUBY install"
echo "======================================="
if type 'rbenv' > /dev/null 2>&1; then
  echo '✅ Exist! .rbenv cmd.'
else
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src
  # When not throgh PATH.
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile 
  # 上記 .bash_profile に追記したモノを 更新させる。
  source ~/.bash_profile

  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile # ✅
  or
  eval "$(rbenv init -)"

  echo ✅ PATH: OK. so far.

  # Install ruby-build, which provides the rbenv install command that simplifies the process of installing new Ruby versions.

  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
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

# =======================================
# GIT INSTALL
# =======================================
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
echo "🔎 Check Brew🍺 now"
sleep 1
echo 🐣
sleep .3
echo .
sleep .3
echo .
sleep 1
echo 🐥
sleep .3
echo .
sleep .3
echo .
sleep 1
echo "======================================="
# if type "brew" > /dev/null 2>&1; then
#   echo "Exist! brew ✅" #コマンドが存在する時の処理
# else
#   echo "NOT exist Brew!" #コマンドが存在しないときの処理
#   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
# fi


# Check for Homebrew
if test ! $(which brew)
then
  echo "🐽 NOT exist Brew!" #コマンドが存在しないときの処理
  echo "  Installing Homebrew for you."
  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    /bin/bash cd $HOME && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    sleep 1
    echo 🐓
    sleep .3
    echo .
    sleep .3
    echo .
    sleep .3
    echo 🍗
    sleep 1
    echo "🎉 Installed! Brew🍺 " #コマンドが存在する時の処理
    sleep 1
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    /bin/bash cd $HOME && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    sleep 1
    echo 🐓
    sleep .3
    echo .
    sleep .3
    echo .
    sleep .3
    echo 🍗
    sleep .3
    echo .
    sleep 1
    echo "🎉 Installed! Brew🍺 " #コマンドが存在する時の処理
    sleep 1
  fi
fi



ln -sf ${PWD}/.zshrc ${PWD}/.zsh_profile
ln -sf ${PWD}/.zshrc ${PWD}/.zshrc

ln -sf ${PWD}/.bash_profile ${PWD}/.bash_profile
ln -sf ${PWD}/.bashrc ${PWD}/.bashrc
ln -sf ${PWD}/.bashrc.alias ${PWD}/.bashrc.alias
ln -sf ${PWD}/.vimrc ${PWD}/.vimrc
ln -sf ${PWD}/.sqliterc ${PWD}/.sqliterc
# Fish
# if [ -e {確認したいファイルかディレクトリのパス} ]; then
# if [ -e ~/.config ]; then
#     # 存在する場合
# else
#     # 存在しない場合
# fi

# =======================================
ln -sf ${PWD}/fish/config.fish ${HOME}/.config/fish/config.fish
echo "🔎 Check DIR ~/.config/fish/conf.d"
if [ -e ${HOME}/.config/fish/conf.d ]; then
  ln -sf ${PWD}/fish/alias.fish ${HOME}/.config/fish/conf.d/alias.fish
else
  mkdir ${HOME}/.config/fish/conf.d
  ln -sf ${PWD}/fish/alias.fish ${HOME}/.config/fish/conf.d/alias.fish
fi
ln -sf ${PWD}/fish/fish_prompt.fish ${HOME}/.config/fish/functions/fish_prompt.fish
ln -sf ${PWD}/fish/.fish_user_key_bindings.fish ${HOME}/.config/fish/functions/fish_user_key_bindings.fish
# Other
ln -sf ${PWD}/.gitconfig ${HOME}/.gitconfig
# ln -sf ${PWD}/com.googlecode.iterm2.plist${PWD} 

# fish cmd exist? check!
# fish_config > /dev/null 2>&1
# fi
echo "🔎 Now Check fish"
echo "======================================="
# if type '$(which fish)' > /dev/null 2>&1; then
# なぜか上記では 
if [ -e "$(which fish)" ]; then
  echo $(which fish >&1)
  echo "✅ Exist! FISH" #コマンドが存在する時の処理
  # FISH=$(which fish)
  # echo `/usr/local/bin/fish`
  # echo $SHELL
  # echo $FISH
  # echo $($SHELL -eq $FISH)
  # if test ! $($SHELL!=$FISH); then
    chsh -s $(which fish) 
  # fi
  echo 'fish処理完了!!🎉'
else
  echo $(which fish >&2)
  echo "🐷 NOT Exist! fish_config.. 🐷" #コマンドが存在しないときの処理
  exit 
  brew install fish
  chsh -s $(which fish) 
  echo `fish`
  echo 'fish処理完了!!🎉'
fi

# if [ $? -eq 127 ]; then
#   echo "Exist! FISH" 
# else
#   echo "NOT exist!"
#   brew install fish
# fi
echo "🔎 Now Check git.io/fisher"
echo "======================================="
echo "this's Fisher Extention-Management-Tool."
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

echo "🔎 Node.js chack.."
echo "======================================="
# node -v &> /dev/null
# if [ $? -ne 0 ]; then
if type "node -v" > /dev/null 2>&1; then
  echo "🐖\".. NOT exist! Node.js"
  brew install node
else
  echo "✅ Exist! Node.js" 
fi


# chsh -s /bin/zsh
# chsh -s /bin/bash

###########################
## HOW TOO CUSTOM "FISH" ##
###########################
# OPEN at Browser         
# When press below command..   
#
# > $ fish_config


# vim plug setting
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

omf install rbenv
## VimにPowerlineの　fish版です。
fisher add oh-my-fish/theme-bobthefish

echo "======================================="
echo "poserline install at ~/fonts"
echo "======================================="
cd $HOME
# 文字化け 改善
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh


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