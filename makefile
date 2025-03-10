# Define variables
TS_COMPILER = npx tsc
NPM = npm
NPM_BIN = $(shell $(NPM) prefix -g)/bin/gitqq

# Compile TypeScript
build:
	$(TS_COMPILER)

# Compile, link the binary locally and set execution permissions
link: build
	$(NPM) link
	chmod +x $(NPM_BIN)

# Clean the build directory
clean:
	rm -rf dist

# Unlink the local CLI installation
unlink:
	$(NPM) unlink -g gitqq
