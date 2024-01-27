PODMAN_VERSION = 3.4.4
NATIVE_GOOS = linux
NATIVE_GOARCH = amd64

PODMAN_VERSION = 3.4.4

.PHONY: all clean install uninstall

all: podman

podman:
        @echo "===> Downloading podman $(PODMAN_VERSION)" 
        curl -fsSL -o podman-$(PODMAN_VERSION).tar.gz https://github.com/containers/podman/archive/v$(PODMAN_VERSION).tar.gz
        tar -xzf podman-$(PODMAN_VERSION).tar.gz

        @echo "===> Building podman $(PODMAN_VERSION)"
        cd podman-$(PODMAN_VERSION) && make

        @echo "===> Installing podman $(PODMAN_VERSION)" 
        sudo make -C podman-$(PODMAN_VERSION) install

clean:
        @echo "===> Cleaning build artifacts"
        rm -rf podman-$(PODMAN_VERSION).tar.gz podman-$(PODMAN_VERSION)

install: podman

uninstall:
        @echo "===> Uninstalling podman $(PODMAN_VERSION)"
        sudo make -C podman-$(PODMAN_VERSION) uninstall
