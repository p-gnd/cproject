project_name=cproject

# Target to build the Docker image for the builder
builder-build :
	docker build -f builder.Dockerfile -t $(project_name)-builder:latest .
	@echo "Built Docker image $(PROJECT_NAME)-builder:latest"
	
.PHONY: builder-build


# Command to run an interactive Docker container with the $(project_name)-builder image
#
# Enables interactive mode and allocates a TTY
# Specifies platform for compatibility (e.g., on ARM)
# Sets the working directory inside the container
# Mounts the current host directory to /builder/mnt in the container
# Uses the $(project_name)-builder image with the latest tag
# Runs the Bash shell inside the container
#
#
builder-run:
	@echo "Starting $(project_name)-builder container..."
	docker run \
		--rm \
		-it \
		--platform linux/amd64 \
		--workdir /builder/mnt \
		-v .:/builder/mnt \
		$(project_name)-builder:latest \
		/bin/bash


# Declares that builder-build, builder-run, and help are "phony" targets (not associated with files)
.PHONY: builder-build builder-run help

# Help target to display available commands and their descriptions
help:
	@echo "Makefile Usage Guide"
	@echo ""
	@echo "Available targets:"
	@echo "  builder-build      Builds the Docker image for the project using builder.Dockerfile"
	@echo "  builder-run        Starts an interactive Docker container with the $(PROJECT_NAME)-builder image"
	@echo "  help               Shows this help guide"
	@echo ""
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Examples:"
	@echo "  make builder-build    # Builds the Docker image"
	@echo "  make builder-run      # Starts a Docker container with the built image"
	@echo "  make help             # Displays this help guide"
	
	