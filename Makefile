# Python コンテナのホームディレクトリ
CONTAINER_HOME = /usr/src

# Python version ( default 3.6 )
V := 3.6


start:
	docker run --rm -it -v "$$(pwd):$(CONTAINER_HOME)" -e "HOME=$(CONTAINER_HOME)" --workdir="$(CONTAINER_HOME)" python:$(V) sh -c "sh cleanup.sh || pip install -r requirements.txt && bash"
