# memo:
# 他のシェル（bash以外のshやdashなど）でも利用可能な汎用設定ファイルなようです。
# .bash_profile が存在しない場合に使用されるようです。

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm