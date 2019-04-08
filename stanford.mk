DOCKER_OWNER ?= edxops
DOCKER_OWNER_EDXAPP ?= stvstnfrd
DOCKER_OWNER_FORUM ?= stvstnfrd
OPENEDX_RELEASE=hawthorn.master
export DOCKER_OWNER
export DOCKER_OWNER_EDXAPP
export DOCKER_OWNER_FORUM
export OPENEDX_RELEASE

from_scratch:
	make destroy
	make requirements
	make dev.clone
	make pull
	make dev.provision
	make dev.up
	make logs
