# pysandbox

pysandbox とは **Docker** と **make** を用いた Python 環境です。

## こんな人におすすめ

- すでに Docker をインストールしている
- すでに make をインストールしている
- とりあえず Python の環境を 1 コマンドで用意したい
- 使い捨てコードを実行したい
- ちょっとしたコードの検証をしたい
- PC の site-packages を汚したくない
- pyenv 等を使いたくない
- 全てを Docker で管理したい
- Docker に再利用しないコンテナを保存したくない

## 準備

1. Docker をインストール ( https://docs.docker.com/install/#supported-platforms )
2. make をインストール ( https://www.gnu.org/software/make/ )
  - Mac であれば `brew install make` 等でインストールできます

## 使い方

1. `git clone https://github.com/furuuchitakahiro/pysandbox.git`
2. `cd pysandbox`
3. `make start`

これで Python が実行できる環境を操作できます。

あとはご自由に src ディレクトリにコードを書いて実行してください。

# 機能

- Python 環境仕様後にコンテナごと削除 ( あなたのコードは削除されません )
- `pip install -r requirements.txt` は環境構築時にしているのでわざわざコマンドを実行しなくて良い
- 環境構築時に ./cache 等の余計なディレクトリやファイル等を削除しているのできれいな状態で起動されます
- コンテナにボリュームをマウントしているのエディターでコードを書けばコンテナ内に反映されます

## Q & A

## 用意される環境の Python バージョンは ?

3.6 です。

## Python バージョンを 3.7 でやりたいんだけど

`make start V=3.7`

**V** オプションにバージョンを指定すれば 3.5 でも指定できます。

## パッケージ管理は ? ( requirements.txt )

`pip freeze > ~/requirements.txt`
