{
  project+: {
    fullName: "polarsys.time4sys",
    displayName: "Eclipse Time4Sys"
  },
  jenkins+: {
    plugins+: [
      "jacoco",
    ],
  },
  deployment+: {
    cluster: "okd-c1",
  },
}
