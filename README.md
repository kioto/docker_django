# docker_django

DockerでDjango環境を構築する。

## 1. 実行環境

以下の環境で動作確認を行った。

* MacOS 10.15 (Catalina)
* Docker desktop 2.1.0.3 (38240)

ファイル一覧を示す。

```.
├── Dockerfile          Docker設定ファイル
├── LICENSE             ライセンス
├── README.md           このファイル
├── make_image.sh       Dockerイメージ作成スクリプト
├── requirements.txt    Pythonパッケージ一覧
├── run_container.sh    Dockerコンテナ起動スクリプト
├── service/            共有ディレクトリ（run_container.sh実行時に生成される）
└── setting.sh          スクリプトの設定ファイル
```

## 2. 構築する環境

### 2-1. インストールするソフトウェア

* Ubuntu 18.04
* Python3
* Django

Djangoのバージョンは`requirements.txt`で設定する。

### 2-2. ディレクトリ構成

```
/service/      Djangoアプリケーション用ディレクトリ
```

Djangoアプrケーション用ディレクトリは、作業ディレクトリのserviceと共有する。

### 2-3. 各種パラメータ

|項目 |値 |
|--|--|
|Dockerイメージ名 | web_django |
|Dockerコンテナ名 | django_container |
|インストール先作業パス | /service |

## 3. 構築手順

### 3-1. Dockerイメージ作成

以下のスクリプトを実行する。

```
sh make_image.sh
```

Dockerイメージが生成されたかを確認する。

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
web_django          latest              XXXXXXXXXXXX        XXXXXXXXXXXXXX      XXXXXX
```

### 3-2. コンテナ起動

以下のスクリプトを実行する。

```
sh run_container
```

コンテナが起動されたか確認する。

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                      NAMES
4cf6c9c26971        web_django          "/bin/bash"         3 seconds ago       Up 2 seconds        127.0.0.1:8000->8000/tcp   django_container
```

### 3-3. コンテナのシェルに接続

以下のコマンドを実行する。<br>
（コンテナIDは`docker ps`で表示された`4cf6c9c26971`とする）

```
docker attach 4cf6c9c26971
```

ログイン時にカレントディレクトリが`/service`であることを確認。

```
root@4cf6c9c26971:/service# pwd
/service
```

## 4. 参考資料

* [Djangoの開発環境をDockerで作ってみた](https://qiita.com/homines22/items/2730d26e932554b6fb58)
