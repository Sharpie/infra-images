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

target "dante" {
  context = "images/dante"
  contexts = {
    debian-12-base = "target:debian-12-base"
  }
  dockerfile = "Containerfile"
}

target "headscale" {
  context = "images/headscale"
  contexts = {
    debian-12-base = "target:debian-12-base"
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
