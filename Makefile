# Directory Variables for Relative Paths
PACKAGE_DIR=app
CONFIGURATION_DIR=config
UTILITY_DIR=app/util

# Ensures clean and run are not interpreted as files
all: clean install run
.PHONY: all 

clean-install:
	rm -rf node_modules ; pip install -r $(CONFIGURATION_DIR)/requirements.txt ; npm install ;
		npm install -g eslint yarn electron-prebuilt

install:
	pip install -r $(CONFIGURATION_DIR)/requirements.txt ; yarn install

run:
	electron . ; python -m $(PACKAGE_DIR).cli -n

cli:
	python -m $(PACKAGE_DIR).cli -n

clean:
	find . -name '*.pyc' -delete ;

lint-py:
	pylint app --rcfile=config/.pylintrc

test:
	pytest

push:
	git push origin; git push 360;

### =============  Utilities  ============= ###

tree:
	python $(UTILITY_DIR)/listfiles.py

capture-pictures:
	python $(UTILITY_DIR)/capturepictures.py

snap:
	python $(UTILITY_DIR)/snapstreams.py --output ../../out


