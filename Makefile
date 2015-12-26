IMAGE32 = jdhebden/wine32
IMAGE64 = jdhebden/wine64
INSTANCE32 = wine32-builder
INSTANCE64 = wine64-builder
DATAGIT = wine
VER     = 1.8
NAME    = wine-$(VER)
REV     = -1
BLDVER  = $(NAME)$(REV)
DATA    = $(NAME)-data$(REV)
VOLUME  = $(shell pwd)/build

build: builddeb32image builddeb64image clone volume $(VOLUME)/git build64image build32image build64 build32

volume:
	mkdir -p $(VOLUME)
	mkdir -p $(VOLUME)/git

clone:
	test -d $(VOLUME)/git/.git || git clone -b $(NAME) git://source.winehq.org/git/wine.git $(VOLUME)/git

builddeb64image:
	@echo [[ docker image -q jdhebden/debian64 == "" ]] || /usr/share/docker.io/contrib/mkimage.sh -t jdhebden/debian64:sid debootstrap --variant=minbase --arch=amd64 sid

builddeb32image:
	@echo [[ docker image -q jdhebden/debian32 == "" ]] || /usr/share/docker.io/contrib/mkimage.sh -t jdhebden/debian32:sid debootstrap --variant=minbase --arch=i386 sid 

build64image:
	docker build -t $(IMAGE64) wine64/

build32image:
	docker build -t $(IMAGE32) wine32/

rebuild64image:
	docker build --no-cache=true -t $(IMAGE64) wine64/

rebuild32image:
	docker build --no-cache=true -t $(IMAGE32) wine32/

build64:
	docker run -it --rm --name $(INSTANCE64) -v $(VOLUME):/usr/src/wine $(IMAGE64)

build32:
	docker run -it --rm --name $(INSTANCE32) -v $(VOLUME):/usr/src/wine $(IMAGE32)

bash64:
	docker run -it --rm --name $(INSTANCE64) -v $(VOLUME):/usr/src/wine $(IMAGE64) /bin/bash

bash32:
	docker run -it --rm --name $(INSTANCE32) -v $(VOLUME):/usr/src/wine $(IMAGE32) /bin/bash

stop32:
	docker stop $(INSTANCE32)
	docker rm $(INSTANCE32)

stop64:
	docker stop $(INSTANCE64)
	docker rm $(INSTANCE64)

stop: stopbuilder32 stopbuilder64

rebuild: rebuildbuilder32 rebuildbuilder64

