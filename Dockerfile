FROM alpine:latest AS build

# Install dependencies
RUN apk add --no-cache \
	git \
	curl \
	unzip \
	tar \
	gzip \
	neovim \
	nvim-lspconfig \
	ripgrep

CMD [ "/usr/bin/nvim" ]
