.PHONY: install
install:
	pnpm install

.PHONY: watch
watch:
	pnpm exec shadow-cljs watch app

.PHONY: compile
compile:
	clojure -T:build compile-cljs

.PHONY: build
build:
	pnpm exec shadow-cljs release app

.PHONY: package
package:
	clojure -T:build package

.PHONY: release
release:
	clojure -T:build release

.PHONY: clean
clean:
	clojure -T:build clean
