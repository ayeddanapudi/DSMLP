# Choose a smaller base image if possible
ARG BASE_CONTAINER=python:3.9-slim

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# Switch to root user for system-level installations
USER root

# Install g++ and clean up
RUN apt-get update && \
    apt-get install -y g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# Switch back to the notebook user
USER jovyan

# Install Python packages
RUN pip install --no-cache-dir networkx scipy

# Override command to disable running Jupyter Notebook at launch
# CMD ["/bin/bash"]
