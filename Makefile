PROJECT=gotify/build

BASE = build/build-base.timestamp

build: build-linux-amd64 build-linux-arm-7 build-linux-arm64 build-linux-386 build-windows-amd64 build-windows-386
push:  push-linux-amd64  push-linux-arm-7  push-linux-arm64  push-linux-386  push-windows-amd64  push-windows-386

$(BASE):
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-base -f Dockerfile.base .
	mkdir -p build
	touch $@

build-windows-amd64: $(BASE)
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-windows-amd64 -f Dockerfile.windows-amd64 .

push-windows-amd64: $(BASE)
	docker push ${PROJECT}:${GO_VERSION}-windows-amd64

build-windows-386: $(BASE)
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-windows-386 -f Dockerfile.windows-386 .

push-windows-386: $(BASE)
	docker push ${PROJECT}:${GO_VERSION}-windows-386

build-linux-amd64: $(BASE)
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-amd64 -f Dockerfile.linux-amd64 .

push-linux-amd64: $(BASE)
	docker push ${PROJECT}:${GO_VERSION}-linux-amd64

build-linux-386: $(BASE)
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-386 -f Dockerfile.linux-386 .

push-linux-386: $(BASE)
	docker push ${PROJECT}:${GO_VERSION}-linux-386

build-linux-arm-7: $(BASE)
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-arm-7 -f Dockerfile.linux-arm-7 .

push-linux-arm-7: $(BASE)
	docker push ${PROJECT}:${GO_VERSION}-linux-arm-7

build-linux-arm64: $(BASE)
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-arm64 -f Dockerfile.linux-arm64 .

push-linux-arm64: $(BASE)
	docker push ${PROJECT}:${GO_VERSION}-linux-arm64
