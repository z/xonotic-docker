# xonotic-docker

Docker images for Xonotic, a fast-paced FOSS GPL FPS for Linux, OSX and Windows

Ready to run as a dedicated server.

## Usage

```
$ docker run --name some-xonotic -d detrate/xonotic-docker:stable
```

This image includes `EXPOSE 26000` (the default Xonotic port), so standard container linking will make it automatically available to the linked containers. By default the `./server_linux.sh` or `./all run dedicated` script, respectively, is run which looks for a `~/.xonotic/data/server.cfg` file.

**docker-compose**

```yaml
version: '2'
services:
  xonotic_stable:
    image: detrate/xonotic-docker:stable
    command: ./server_linux.sh -game data_csprogs -game data_insta -sessionid insta +serverconfig configs/info-overkill.cfg
    ports:
      - "26011-26014:26011-26014/udp"
    volumes:
      - ~/.xonotic/servers.pk3dir:/root/.xonotic/data/servers.pk3dir    
  xonotic_git:
    image: detrate/xonotic-docker:git
    # Run a single server
    command: ./all run dedicated +serverconfig server.cfg   
```

## Building

```
docker build . -t detrate/xonotic:stable -f xonotic_stable.Dockerfile
docker build . -t detrate/xonotic:autobuild -f xonotic_autobuild.Dockerfile
docker build . -t detrate/xonotic:git -f xonotic_git.Dockerfile
```

## Configuration

`stable` and `autobuild` have a configurable URL for the xonotic package:

```
XONOTIC_DOWNLOAD_URL=http://dl.xonotic.org/xonotic-0.8.1.zip
```

## License

Copyright (c) 2016 Tyler Mulligan (z@xnz.me) and contributors.

Distributed under the MIT license. See the LICENSE file for more details.