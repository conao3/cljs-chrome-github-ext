.PHONY: install
install:
	pnpm install

.PHONY: watch
watch:
	pnpm exec shadow-cljs watch app

.PHONY: compile
compile:
	clojure -T:build compile-cljs

.PHONY: release
release:
	clojure -T:build release

.PHONY: clean
clean:
	rm -rf dev-resources/public/dist
	clojure -T:build clean
