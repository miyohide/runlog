# Rails Newのコマンドオプション生成

[RailsNewIo](https://railsnew.io/)にて生成する。

今回は以下のコマンドを使う。

```
rails new my_app -d postgresql --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-listen --skip-spring --skip-system-test --skip-turbolinks
```

# RubyをインストールせずにDockerだけを使ってrails newを実行する

このブログ記事を参考にする。

[Rubyをインストールせず Docker だけを使ってrails newを実行する](https://sinsoku.hatenablog.com/entry/2021/04/03/001227)

上のコマンドを使って、以下を実行する。

```
docker run --rm -v $(pwd):/app -w /app ruby:3.0.0 bash -c '\
curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
&& apt-get update && apt-get install -y git nodejs \
&& npm install -g yarn \
&& gem i --no-document rails \
&& rails new . -d postgresql --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-listen --skip-spring --skip-system-test --skip-turbolinks'
```

# Dockerfileを作成する

このブログを参考にする。

[Railsアプリの開発環境向けDockerfile + docker-compose.yml](https://sinsoku.hatenablog.com/entry/2021/03/24/100000)

Chromeのインストールは今はしない（System Testはちょっと後で）。

# docker-compose.ymlを作成する

上記のブログと同じ。Redisやworkerはいったん削除。

# 本番用のDockerfileを作る

とりあえず動作確認用で`Dockerfile.prd`として作成。`docker build -f Dockerfile.prd -t 名前 .`で作成する。

# Railsのコマンドを実行する

コンテナの中に入って、そこで`bin/rails`コマンドを叩く。

```
$ docker-compose run --rm web bash
root@xxxxxx:/app# bin/rails g scaffold runrecord starttime:timestamp distance:float runtime:integer
```
