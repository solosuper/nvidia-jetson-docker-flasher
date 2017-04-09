FROM ubuntu:16.04
LABEL maintainer "solosuper"

RUN apt update && apt-get install -y --no-install-recommends \
  bzip2 \
  sudo \
  && apt-get clean

# Copy 'Jetson TX1 64-bit Driver Package'
COPY Tegra210_Linux_R24.2.1_aarch64.tbz2 /jetson/

# Copy 'Sample Root Filesystem'
COPY Tegra_Linux_Sample-Root-Filesystem_R24.2.1_aarch64.tbz2 /jetson/

ENV L4T_RELEASE_PACKAGE=Tegra210_Linux_R24.2.1_aarch64.tbz2
ENV SAMPLE_FS_PACKAGE=Tegra_Linux_Sample-Root-Filesystem_R24.2.1_aarch64.tbz2

WORKDIR /jetson/
RUN tar xpf ${L4T_RELEASE_PACKAGE}
WORKDIR /jetson/Linux_for_Tegra/rootfs/
RUN tar xpf /jetson/${SAMPLE_FS_PACKAGE}
WORKDIR /jetson/Linux_for_Tegra/
RUN /bin/bash apply_binaries.sh
RUN rm /jetson/${L4T_RELEASE_PACKAGE} /jetson/${SAMPLE_FS_PACKAGE}