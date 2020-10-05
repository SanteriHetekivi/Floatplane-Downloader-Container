# Floatplane Downloader support's max node 10.22.1 (v64).
FROM node:10.22.1

# Set labels.
LABEL version="0.1"
LABEL maintaner="Santeri Hetekivi <floatplane@hetekivi.com>"
LABEL release-date="2020-10-05"

# Install ffmpeg.
RUN apt-get update
RUN apt-get install -y ffmpeg

# Set main directory.
ARG PATH_MAIN_DIR=/floatplane
RUN mkdir -p $PATH_MAIN_DIR
WORKDIR $PATH_MAIN_DIR

# Get Floatplane Downloader code.
ARG FLOATPLANE_DOWNLOADER_VERSION=4.6.3
ARG FLOATPLANE_DOWNLOADER_DIR_URL=https://raw.githubusercontent.com/Inrixia/Floatplane-Downloader/master/releases
RUN wget $FLOATPLANE_DOWNLOADER_DIR_URL/$FLOATPLANE_DOWNLOADER_VERSION.zip
RUN unzip $FLOATPLANE_DOWNLOADER_VERSION.zip
RUN rm $FLOATPLANE_DOWNLOADER_VERSION.zip

# Install packages.
RUN npm install

# Initialize files if they do not exists.
RUN if [ ! -f $PATH_MAIN_DIR/partial.json ]; then echo "{}" > $PATH_MAIN_DIR/partial.json; fi
RUN if [ ! -f $PATH_MAIN_DIR/videos.json ]; then echo "{}" > $PATH_MAIN_DIR/videos.json; fi

# Run the script.
ENTRYPOINT ["node", "/floatplane/float.js"]
