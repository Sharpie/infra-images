target "alpine-3-base" {
  context = "images/alpine-3-base"
  dockerfile = "Containerfile"
}

target "debian-12-base" {
  context = "images/debian-12-base"
  dockerfile = "Containerfile"
}

target "debian-12-systemd" {
  context = "images/debian-12-systemd"
  contexts = {
    debian-12-base = "target:debian-12-base"
  }
  dockerfile = "Containerfile"
}

target "debian-13-base" {
  context = "images/debian-13-base"
  dockerfile = "Containerfile"
}

target "debian-13-systemd" {
  context = "images/debian-13-systemd"
  contexts = {
    debian-13-base = "target:debian-13-base"
  }
  dockerfile = "Containerfile"
}

target "dante" {
  context = "images/dante"
  contexts = {
    debian-12-base = "target:debian-12-base"
  }
  dockerfile = "Containerfile"
}

target "forgejo-runner" {
  context = "images/forgejo-runner"
  contexts = {
    debian-13-base = "target:debian-13-base"
  }
  dockerfile = "Containerfile"
}

target "gocryptfs" {
  context = "images/gocryptfs"
  contexts = {
    debian-13-base = "target:debian-13-base"
  }
  dockerfile = "Containerfile"
}

target "headscale" {
  context = "images/headscale"
  contexts = {
    debian-13-base = "target:debian-13-base"
  }
  dockerfile = "Containerfile"
}

target "nfs" {
  context = "images/nfs"
  contexts = {
    debian-12-systemd = "target:debian-12-systemd"
  }
  dockerfile = "Containerfile"
}

target "novnc" {
  context = "images/novnc"
  contexts = {
    debian-13-base = "target:debian-13-base"
  }
  dockerfile = "Containerfile"
}

target "playwright" {
  context = "images/playwright"
  dockerfile = "Containerfile"
}

target "restic" {
  context = "images/restic"
  contexts = {
    alpine-3-base = "target:alpine-3-base"
  }
  dockerfile = "Containerfile"
}
