{
  project+: {
    fullName: "technology.sailing-analytics",
    displayName: "Eclipse Azimuth Sailing Analytics",
  },
  clouds+: {
    kubernetes+: {
      local currentCloud = self,
      templates+: {
        "basic-xmx512": currentCloud.templates["basic"] {
          labels: ["basic-xmx512"],
          env+: {
            JENKINS_REMOTING_JAVA_OPTS: [
              "-showversion",
              "-XshowSettings:vm",
              "-Xmx512m",
              "-Dorg.jenkinsci.remoting.engine.JnlpProtocol3.disabled=true",
              "-Dorg.jenkinsci.plugins.gitclient.CliGitAPIImpl.useSETSID=true"
            ],
          },
        },
      },
    },
  },
}
