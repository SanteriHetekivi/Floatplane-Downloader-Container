# Floatplane-Downloader-Container

Docker container for [Floatplane Club - PlexDownloader](https://github.com/Inrixia/Floatplane-Downloader).

## Using example [compose](docker-compose.yml) file.
1. Copy `_example` files in [config directory](config) to new files without `_example` part.
2. Configure [`config/settings.json`](config/settings.json) file according to [Floatplane Club - PlexDownloader wiki file](https://github.com/Inrixia/Floatplane-Downloader/blob/4.6.3/wiki/settings.md).
3. Set `./videos` path to host path you want videos to load in [compose](docker-compose.yml) (Default `./videos`).
3. Run `docker-compose up` in directory that [compose](docker-compose.yml) file exists.

## Using DockerHub volume.
* Use volume [`santerihetekivi/floatplane-downloader-container`]()
* Mount same files and directories that [`docker-compose.yml`](docker-compose.yml) file has.

## Building with [Dockerfile](Dockerfile).
* Run `docker build .` in directory that [Dockerfile](Dockerfile) file exists.