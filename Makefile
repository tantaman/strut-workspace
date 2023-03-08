# Make:
# cr-sqlite - loadable (just run build?)
# crsqlite-js tsbuild-all (just run build?)
# model-js build-all (just run build?)
# misc-js turbo run build (just run build?)
#
# live-example and strut : no build

git-deps = crsqlite-js/deps/wa-sqlite crsqlite-js/deps/emsdk
$(git-deps):
	git submodule update --init --recursive

node-deps = node_modules
$(node-deps): $(git-deps)
	pnpm install

crsqlite:
	cd cr-sqlite/core; \
	make loadable

crsqlite-js: crsqlite $(node-deps)
	cd crsqlite-js && pnpm run build

misc-js:
	cd misc-js/typescript; \
	pnpm run build

model-js: misc-js
	cd model-js/ts && pnpm run build

all: crsqlite crsqlite-js misc-js model-js

.PHONY: crsqlite crsqlite-js misc-js model-js all
