{
  project+: {
    fullName: "adoptium.mc",
    displayName: "Eclipse Mission Control",
  },
  jenkins+: {
    plugins+: [
      "badge",
      "build-with-parameters",
      "embeddable-build-status",
      "groovy-postbuild",
      "http_request",
      "slack",
      "xvfb",
    ],
  },
  seLinuxLevel: "s0:c58,c37",
}