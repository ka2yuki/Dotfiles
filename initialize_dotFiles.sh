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
          echo 'Not brew running..'
          sleep 3
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
          echo '🍺 Homebrew install 🎉 🍺 '
          /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
          # sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
          # https://brew.sh/

          echo "run brew doctor ..."
          which brew >/dev/null 2>&1 && brew doctor
          echo "run brew update ..."
          which brew >/dev/null 2>&1 && brew update
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

# When use Docker: INSTALL: docker-compose
# sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# When use Docker: BUILD: 環境構築
# docker-compose run web rails new . --force --database=postgresql
# DOCUMENT: https://docs.docker.jp/compose/rails.html

# CREATE: synbol link.
ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
ln -sf ${PWD}/bash/.bashrc ${HOME}/.bashrc
ln -sf ${PWD}/.vimrc ${HOME}/.vimrc
ln -sf ${PWD}/.sqliterc ${HOME}/.sqliterc

# cp -f ${PWD}/zsh/.zsh_profile ${HOME}/.zsh_profile
# cp -f ${PWD}/zsh/.zshrc ${HOME}/.zshrc
# cp -f ${PWD}/zsh/.zprofile ${HOME}/.zprofile
# cp -f ${PWD}/bash/.bash_profile ${HOME}/.bash_profile
# cp -f ${PWD}/bash/.bashrc ${HOME}/.bashrc
# cp -f ${PWD}/bash/.bashrc.alias ${HOME}/.bashrc.alias
# cp -f ${PWD}/.vimrc ${HOME}/.vimrc
# cp -f ${PWD}/.sqliterc ${HOME}/.sqliterc

# 上記 .bash_profile に追記したモノを 更新させる。
# export PATH=$PATH:追加するディレクトリ名
source ~/.bashrc
source ~/.zshrc


echo "======================================="
echo "Try rbenv install"
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


# echo "======================================="
# echo "GIT INSTALL"
# echo "======================================="
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
# sleep 5
# echo "====================="
# Other
# echo "====================="
# ホストを晒すのは　NG。
# sudo cp ${PWD}/hosts ${HOME}/etc/hosts

# iterm2の設定の自動反映。
# ln -sf ${PWD}/com.googlecode.iterm2.plist${PWD} 
# echo "====================="
# Other
# echo "====================="

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

echo "======================================="
echo "🧛install theme for Hyper.app"
echo https://draculatheme.com/
printf "${COLOR_1}https://draculatheme.com/${COLOR_OFF}"
echo "======================================="
# git clone https://github.com/dracula/iterm.git
hyper install hyper-dracula


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

echo 
echo "Done!!🎉"
echo 
echo 
