# Python コンテナのホームディレクトリ
CONTAINER_HOME = /usr/src

# Default Python version
V := 3.6

BASE_CMD = docker run --rm -it -v "$$(pwd):$(CONTAINER_HOME)" -e "HOME=$(CONTAINER_HOME)" --workdir="$(CONTAINER_HOME)" python:$(V)

.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

start: ## Python 環境起動
	$(BASE_CMD) sh -c "sh cleanup.sh || pip install -r requirements.txt && bash"

cleanup: ## .cache や __pycache__ 等を削除
	$(BASE_CMD) sh cleanup.sh

rm_git: ## pysandbox の .git を削除
	-rm -rf .git
	-rm ./src/.gitkeep
