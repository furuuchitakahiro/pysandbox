# Python コンテナのホームディレクトリ
CONTAINER_HOME = /usr/src

# Default Python version
V := 3.6

# Docker ベースコマンド
BASE_CMD = docker run --rm -it -v "$$(pwd):$(CONTAINER_HOME)" -e "HOME=$(CONTAINER_HOME)" --workdir="$(CONTAINER_HOME)" python:$(V)

# pip install コマンド
PIP_INSTALLS_CMD = pip install -r requirements.txt

# エディタ補完用の手元のパッケージディレクトリ ( コンテナのディレクトリ )
LOCAL_PACKAGES_DIR = ~/.site-packages

.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

start: ## Python 環境起動
	$(BASE_CMD) sh -c "sh cleanup.sh | $(PIP_INSTALLS_CMD) && bash"

cleanup: ## .cache や __pycache__ 等を削除
	$(BASE_CMD) sh cleanup.sh

rm_git: ## pysandbox の .git を削除
	-rm -rf .git
	-rm ./src/.gitkeep

copy_packages: ## エディタ補完用に .site-packages ディレクトリにパッケージをコピー ( Python バージョンにご注意ください V オプションで指定できます )
	$(BASE_CMD) sh -c "$(PIP_INSTALLS_CMD) && rm -rf $(LOCAL_PACKAGES_DIR) | mkdir $(LOCAL_PACKAGES_DIR) | cp -r /usr/local/lib/python$(V)/site-packages/* $(LOCAL_PACKAGES_DIR)"
