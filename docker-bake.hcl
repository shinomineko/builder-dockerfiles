group "default" {
  targets = [
    "builder_dotnet50",
    "builder_dotnet60",
    "builder_dotnet60node14",
    "builder_dotnet60node16",
    "builder_dotnet70",
    "builder_node14",
    "builder_node16",
    "builder_node18",

    "robotframework_runner_bionic"
  ]
}

variable "LABELS" {
  default = {
    "org.opencontainers.image.url" = "https://github.com/shinomineko/builder-dockerfiles"
    "org.opencontainers.image.source" = "https://github.com/shinomineko/builder-dockerfiles"
    "org.opencontainers.image.created" = timestamp()
    "org.opencontainers.image.revision" = "main"
  }
}

variable "REGISTRY" {
  default = "docker.io"
}

variable "REPO_BUILDER" {
  default = "shinomineko/builder"
}

target "builder_dotnet50" {
  context = "builder/dotnet-sdk5.0-alpine"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "builder"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/${REPO_BUILDER}:dotnet-sdk5.0-alpine"]
}

target "builder_dotnet60" {
  context = "builder/dotnet-sdk6.0-alpine"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "builder"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/${REPO_BUILDER}:dotnet-sdk6.0-alpine"]
}

target "builder_dotnet60node14" {
  context = "builder/dotnet-sdk60-node14-alpine"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "builder"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/${REPO_BUILDER}:dotnet-sdk60-node14-alpine"]
}

target "builder_dotnet60node16" {
  context = "builder/dotnet-sdk60-node16-alpine"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "builder"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/${REPO_BUILDER}:dotnet-sdk60-node16-alpine"]
}

target "builder_dotnet70" {
  context = "builder/dotnet-sdk70-alpine"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "builder"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/${REPO_BUILDER}:dotnet-sdk70-alpine"]
}

target "builder_node14" {
  context = "builder/node14-bullseye"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "builder"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/${REPO_BUILDER}:node14-bullseye"]
}

target "builder_node16" {
  context = "builder/node16-bullseye"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "builder"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/${REPO_BUILDER}:node16-bullseye"]
}

target "builder_node18" {
  context = "builder/node18-bullseye"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "builder"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/${REPO_BUILDER}:node18-bullseye"]
}

target "robotframework_runner_bionic" {
  context = "robotframework-runner/bionic-chromium"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "robotframework-runner"})
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/shinomineko/robotframework-runner:bionic-chromium"]
}
