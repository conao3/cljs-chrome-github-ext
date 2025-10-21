.PHONY: watch
watch:
	pnpm exec shadow-cljs watch app

.PHONY: build
build:
	pnpm exec shadow-cljs release app

.PHONY: clean
clean:
	rm -rf resources/public/js .shadow-cljs node_modules
