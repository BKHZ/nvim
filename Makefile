default: lint

.PHONY: lint

lint:
	luacheck .
