Infra Images
============

Containerized builds of various infrastructure tools. Re-built by
cron jobs at least every 15 days and occasionally more frequently
by Git pushes. Published to GitHub Package Registry.

Older builds are deleted after 90 days because this project is
about keeping up with OS patches and not about maintaining 
historical artifacts.

All images are built for the AMD64 architecture. Most are also built
for the ARM64 architecture.


Images
------

### GocryptFS
[![GocryptFS Build Status](https://github.com/Sharpie/infra-images/actions/workflows/build_gocryptfs.yaml/badge.svg?branch=main)](https://github.com/Sharpie/infra-images/actions/workflows/build_gocryptfs.yaml) ![GocryptFS Version](https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2FSharpie%2Finfra-images%2Frefs%2Fheads%2Fmain%2Fimages%2Fgocryptfs%2FContainerfile&search=ARG%20VERSION%3D(%3F%3Cversion%3E.*)&replace=%24%3Cversion%3E&label=GocryptFS%20Version)

[Encrypted overlay filesystem written in Go][gocryptfs]. This build packages
the binary in a Debian 13 container and provides filesystem initialization
logic.

[gocryptfs]: https://github.com/rfjakob/gocryptfs

```sh
docker pull ghcr.io/sharpie/gocryptfs:latest
```

### Headscale
[![Headscale Build Status](https://github.com/Sharpie/infra-images/actions/workflows/build_headscale.yaml/badge.svg?branch=main)](https://github.com/Sharpie/infra-images/actions/workflows/build_headscale.yaml) ![Headscale Version](https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2FSharpie%2Finfra-images%2Frefs%2Fheads%2Fmain%2Fimages%2Fheadscale%2FContainerfile&search=ARG%20VERSION%3D(%3F%3Cversion%3E.*)&replace=%24%3Cversion%3E&label=Headscale%20Version)

> [!NOTE]
> Version currently pinned to 0.26.1 while issues around the database
> refactor in 0.27.0 are worked out.

[Self-hostable Tailscale control server][headscale]. This build
exists for two reasons:

  - Headscale manages network config. A Debian userland with
    pre-installed networking tools is very useful for debugging.

  - Headscale has a slow release cadence. This build ensures OS
    patches are taken up frequently.

[headscale]: https://headscale.net

```sh
docker pull ghcr.io/sharpie/headscale:latest
```

### noVNC
[![noVNC Build Status](https://github.com/Sharpie/infra-images/actions/workflows/build_novnc.yaml/badge.svg?branch=main)](https://github.com/Sharpie/infra-images/actions/workflows/build_novnc.yaml)

A container that runs a noVNC server. This is useful as a sidecar to
bridge containerized x11 apps to a viewport that can be visited with
a browser.

Adapted from: https://github.com/theasp/docker-novnc

```sh
docker pull ghcr.io/sharpie/novnc:latest
```

### Playwright
[![Playwright Build Status](https://github.com/Sharpie/infra-images/actions/workflows/build_playwright.yaml/badge.svg?branch=main)](https://github.com/Sharpie/infra-images/actions/workflows/build_playwright.yaml) ![Playwright Version](https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2FSharpie%2Finfra-images%2Frefs%2Fheads%2Fmain%2Fimages%2Fplaywright%2FContainerfile&search=ARG%20VERSION%3D(%3F%3Cversion%3E.*)&replace=%24%3Cversion%3E&label=Playwright%20Version)

Playwright server useful for scraping and scripted interactions with
websites. Based on the `mcr.microsoft.com/playwright` with the following
modifications:

  - Firefox browser is installed by default.
  - Container default command is set to run the playwright server
    at: `http://localhost:8080/ws`

Tested for compatibility with [`playwright-ruby-client`][ruby-playwright].
Pairs well with the [noVNC](#noVNC) container.

[ruby-playwright]: https://github.com/YusukeIwaki/playwright-ruby-client
