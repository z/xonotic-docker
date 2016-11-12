# xonotic-docker

Docker images for Xonotic, a fast-paced FOSS GPL FPS for Linux, OSX and Windows

## Building

```
docker build . -t detrate/xonotic:stable -f xonotic_stable.Dockerfile
docker build . -t detrate/xonotic:git -f xonotic_git.Dockerfile
```

## Configuration

`stable` has a configurable URL for the xonotic package:

```
XONOTIC_DOWNLOAD_URL=http://dl.xonotic.org/xonotic-0.8.1.zip
```

## License

Copyright (c) 2016 Tyler Mulligan (z@xnz.me) and contributors.

Distributed under the MIT license. See the LICENSE file for more details.