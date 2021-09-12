variable "MKDOCS_MATERIAL_VERSION" {
  default = "7.2.6"
}

target "_common" {
  args = {
    MKDOCS_MATERIAL_VERSION = MKDOCS_MATERIAL_VERSION
  }
}

group "default" {
  targets = ["release"]
}

target "base" {
  inherits = ["_common"]
  target = "base"
  output = ["type=docker"]
  tags = ["docs:local"]
}

target "release" {
  inherits = ["_common"]
  target = "release"
  output = ["./site"]
}
