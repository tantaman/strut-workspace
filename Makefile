# Make:
# cr-sqlite - loadable (just run build?)
# crsqlite-js tsbuild-all (just run build?)
# model-js build-all (just run build?)
# misc-js turbo run build (just run build?)
#
# live-example and strut : no build

ifeq ($(shell uname -s),Darwin)
CONFIG_DARWIN=y
else ifeq ($(OS),Windows_NT)
CONFIG_WINDOWS=y
else
CONFIG_LINUX=y
endif

ifdef CONFIG_DARWIN
LOADABLE_EXTENSION=dylib
endif

ifdef CONFIG_LINUX
LOADABLE_EXTENSION=so
endif

ifdef CONFIG_WINDOWS
LOADABLE_EXTENSION=dll
endif

TARGET_LOADABLE=cr-sqlite/core/dist/crsqlite.$(LOADABLE_EXTENSION)

deps: crsqlite-js/deps/wa-sqlite crsqlite-js/deps/emsdk
	git submodule update --init --recursive

crsqlite:
	cd cr-sqlite && make

crsqlite-js: crsqlite deps
	cd crsqlite-js && pnpm run build

misc-js:
	cd misc-js && pnpm run build

model-js: misc-js
	cd model-js && pnpm run build

all: crsqlite crsqlite-js misc-js model-js
	echo "done"

.PHONY: crsqlite crsqlite-js misc-js model-js all deps
