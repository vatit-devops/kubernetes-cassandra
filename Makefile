# Copyright 2017 Harry Lee
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VERSION?=v1.0
PROJECT?=vatit
CASSANDRA_VERSION?=3.10

all: build

docker: 
	docker build --pull --build-arg "CASSANDRA_VERSION=${CASSANDRA_VERSION}" -t ${PROJECT}/cassandra:${VERSION} .

docker-dev: 
	docker build --pull --build-arg "CASSANDRA_VERSION=${CASSANDRA_VERSION}" --build-arg "DEV_CONTAINER=1" -t ${PROJECT}/cassandra:${VERSION}-dev .

build: docker

build-dev: docker-dev

push: build
	docker push ${PROJECT}/cassandra:${VERSION}

push-dev: build-dev
	docker push ${PROJECT}/cassandra:${VERSION}-dev

push-all: build build-dev push push-dev

.PHONY: all build push docker docker-dev build-dev push push-all