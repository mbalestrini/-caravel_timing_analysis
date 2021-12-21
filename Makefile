CARAVEL_ROOT = $(shell pwd)/caravel
STD_CELL_LIBRARY = sky130_fd_sc_hd
SPECIAL_VOLTAGE_LIBRARY ?= sky130_fd_sc_hvl

OPENLANE_IMAGE_NAME=efabless/openlane:mpw-3a

# RESULTS_PATH = $(shell pwd)/results
# PROJECT_FILES = $(shell pwd)/project_files

EXIT = ""
ifndef no_exit
	EXIT = -exit
endif

help:
	@echo "Usage: make caravel_sta-<USER_PROJECT_FOLDER_NAME>"
	

caravel_sta-%: 
	echo "\n\033[94mRunning Caravel Timing Analysis\033[0m\n"

	$(eval RESULTS_PATH := $(shell pwd)/results/$*)
	$(eval PROJECT_FILES := $(shell pwd)/user_projects/$*)

	mkdir -p $(RESULTS_PATH)

	docker run -it \
		-v $(PROJECT_FILES):/project_files \
		-v $(RESULTS_PATH):/results \
		-v $(PDK_ROOT):$(PDK_ROOT) \
		-v $(CARAVEL_ROOT):/caravel \
		-e PDK_ROOT=$(PDK_ROOT) \
		-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
		$(OPENLANE_IMAGE_NAME) \
	sh -c " cd /caravel; sta $(EXIT) /project_files/caravel_timing-$*.tcl |& tee /results/sta_$*_$(shell date +%y%m%d_%H%M%S).log" 


get_caravel:
	git clone https://github.com/efabless/caravel
	cd caravel; \
	make install_mcw
