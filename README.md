# 検証OS
- [x] Mac
- [ ] WSL
- [ ] Ubuntu

# Clone
```zsh
git clone https://github.com/ka2yuki/Dotfiles.git
cd Dotfiles
ls -a

sh initialize_dotFiles.sh
```
読み込み順：  
- zshenv > zprofile > zshrc > zloginの順. [more](https://qiita.com/muran001/items/7b104d33f5ea3f75353f)

# 📦 DL ⇣Applications⇣
## 設定を変更する際
必ず `/Dotfile` 下ファイル を 編集する。
エイリアスを吐き出して使用している為。

## iTerm2の設定
Import
1. Profile > Other Actions.. > Inport JSON Profiles...
2. Select file : `Dotfiles/iterms/Profiles.json`

Save
1. Profile > Other Actions.. > Save All Files as JSON...
2. Select file : `Dotfiles/iterms/.`
3. Replace Saving.

# TODO checklists
- [fzf](https://github.com/jethrokuan/fzf): 曖昧(fuzzy)検索:便利そう
- [fish](https://fishshell.com/)
  
2020/10/18

# 不明点
- [ ] installというファイル

# Fish shellについてのメモ
- [~/.config/fish/config.fish](https://fishshell.com/docs/current/faq.html?highlight=config#how-do-i-run-a-command-every-login-what-s-fish-s-equivalent-to-bashrc-or-profile)
- `fish_config`
- Custom Color
  - [Variables for changing highlighting colors¶
  ](https://fishshell.com/docs/current/index#variables-color)
  - [set_color](https://fishshell.com/docs/current/cmds/set_color.html?highlight=color#set-color-set-the-terminal-color)
- Other Commands
  - [Commands](https://fishshell.com/docs/current/commands.html?highlight=alias)


---
---
# 📚Shell Note
## How to write Shell.
### Shellのメモ
- コマンドライン でも使える
- [これだけ覚えておけばOK！シェルスクリプトで冪等性を担保するためのTips集 | qiita](https://qiita.com/yn-misaki/items/3ec0605cba228a7d5c9a)
- [コマンドの有無による条件分岐 | qiita](https://qiita.com/8ayac/items/b6b6f0a385d08659316b)
- https://qiita.com/yn-misaki/items/3ec0605cba228a7d5c9a

```sh
if type "コマンド" > /dev/null 2>&1; then
    # echo "exist!"
    echo "do exist!"  #コマンドが存在する時の処理
else
    echo "NOT exist!" #コマンドが存在しないときの処理
fi
```
↑説明：
```sh
type "コマンド" > /dev/null 2>&1; 
# 1: type "コマンド" 
# 2: 2>&1; 
# 3: > /dev/null 
######補足#######
# $	変数展開($FOO)
# &	コマンドをバックグランド実行(cmd &)

```
[補足link](https://www.tohoho-web.com/ex/shell.html#meta)
1. 標準エラー出力結果
2. 標準出力へマージ
3. 捨てる.`dev/null`に.

[標準エラー出力を捨てるな! | qiita](https://qiita.com/ritukiii/items/b3d91e97b71ecd41d4ea)
## 変数の使い方
- 変数名の先頭に $ を付けない. (<u>**$** は **参照時** のみ</u>)
- <u>＝ 前後</u> に、<u>スペースはNG</u>。
- 変数名の <u>**大文字と小文字は区別**</u> されるため変数 VAR と変数 var は別物
- シェル変数に「型」は存在しないので、文字列や数値を区別なく設定できる。
```sh
VAR1=123456
VAR2=hogehoge
VAR3=" a b c d e f g "
```
## 出力結果のみ、変数に。
```sh
VAR=`command`
# $ VAR=`date`
# $ echo $VAR
# > 2007年 5月 26日 土曜日 02:06:23 JST
```
## エラー出力のみを変数に
```sh
VAR=`command 2>&1 >/dev/null`
```
## 標準出力・エラーの両方を変数に
```sh
VAR=`command 2>&1`
## バッククォートの代替機能。より高機能。
VAR=$(command)
```
# 変数の値を参照
```sh
echo $HOGE
# 変数 VAR の値と「1」を表示
echo ${VAR}1
echo ${PWD}/hoge
echo $PWD"/hoge"
# 変数２つ
echo ${VAR2}${VAR3}
# 他の変数へ
VAR="$VAR1"
```
## 変数値を変数名で参照する
```sh
$ FOO="BAR"
$ BAR="SUCCESS" # FOOに代入した,BARへ.
$ eval echo '$'$FOO # FOO 値 を 参照.
SUCCESS
```
## 変数を削除
```sh
unset VAR
```
## 変数を読み取り専用に
```sh
readonly VAR="hogehoge"
```

## 特殊な変数（自動的に値が設定される
[特殊な変数とその参照](https://shellscript.sunone.me/variable.html#%E7%89%B9%E6%AE%8A%E3%81%AA%E5%A4%89%E6%95%B0%E3%81%A8%E3%81%9D%E3%81%AE%E5%8F%82%E7%85%A7)
## 位置パラメータのまとめ
[位置パラメータのまとめ](https://shellscript.sunone.me/variable.html#%E4%BD%8D%E7%BD%AE%E3%83%91%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF%E3%81%AE%E3%81%BE%E3%81%A8%E3%82%81)
## 環境変数
["一般的な" 環境変数](https://shellscript.sunone.me/variable.html#%E7%92%B0%E5%A2%83%E5%A4%89%E6%95%B0)
一般的
```sh
$PWD
```
非一般的？
```sh
$OSTYPE # OS 別に 処理を分ける際など。
```
