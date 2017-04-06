FROM ubuntu:16.04

############################################################
# Nordic S132 v4.0.2 and S140 v5.0.0-2.alpha 13.0.0 SDK
# https://www.nordicsemi.com/eng/Products/Bluetooth-low-energy/nRF5-SDK
############################################################
ENV SDK_ROOT=/opt/nordic

RUN apt-get update \
    && apt-get install -y lib32ncurses5 lib32z1 \
    && apt-get install -y gcc-arm-none-eabi \
    && apt-get install -y gdb-arm-none-eabi \
    && apt-get install -y build-essential \
    && apt-get install -y unzip \
		&& apt-get install -y wget

RUN mkdir -p /opt/nordic \
		&& wget https://www.nordicsemi.com/eng/nordic/download_resource/59011/61/39400662/116085 -O nordic_sdk.zip \
		&& unzip nordic_sdk.zip 'components/*' 'external/*' 'svd/*' -d $SDK_ROOT \
		&& rm nordic_sdk.zip

COPY Makefile.posix $SDK_ROOT/components/toolchain/gcc/Makefile.posix