.PHONY: build

deploy: build
	git add docs
	git commit -m "deploy"
	git push 

build:
	hugo -d docs
