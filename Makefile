.PHONY: all org-build build

all: org-build

org-build:
	emacs -Q -script ./publish.el

clean:
	rm -rf public
	mkdir -p public

serve:
	npx browser-sync start --server "docs" --files "docs/**/*"

