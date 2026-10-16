# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/datascience-notebook:2025.1-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

USER root

# Match the package versions students were instructed to install, so that
# any leftover user-site (~/.local) copies cannot cause numpy ABI mismatches.
RUN pip install \
    "astropy==8.0.1" \
    "numpy==2.4.6" \
    "matplotlib==3.11.2" \
    "scipy==1.17.1" \
    "astroquery==0.4.11"

USER jovyan
