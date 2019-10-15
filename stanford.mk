DOCKER_OWNER ?= edxops
DOCKER_OWNER_EDXAPP ?= stvstnfrd
DOCKER_OWNER_FORUM ?= stvstnfrd
OPENEDX_RELEASE=hawthorn.master
STANFORD_BRANCH=master
export DOCKER_OWNER
export DOCKER_OWNER_EDXAPP
export DOCKER_OWNER_FORUM
export OPENEDX_RELEASE
export STANFORD_BRANCH

from_scratch:
	make destroy
	make requirements
	make dev.clone
	make pull
	make dev.provision
	make dev.up
	make logs

test:
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && ./scripts/circle-ci-tests.sh'

test-quality:
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && CIRCLE_NODE_TOTAL=4 CIRCLE_NODE_INDEX=0 ./scripts/circle-ci-tests.sh'

test-lms:
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && CIRCLE_NODE_TOTAL=4 CIRCLE_NODE_INDEX=1 ./scripts/circle-ci-tests.sh'

test-cms:
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && CIRCLE_NODE_TOTAL=4 CIRCLE_NODE_INDEX=2 ./scripts/circle-ci-tests.sh'

test-common:
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && CIRCLE_NODE_TOTAL=4 CIRCLE_NODE_INDEX=3 ./scripts/circle-ci-tests.sh'
