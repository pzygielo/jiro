local permissionsTemplates = import '../../templates/permissions.libsonnet';

{
  project+: {
    fullName: "tools.oomph",
    displayName: "Eclipse Oomph",
    resourcePacks: 2,
  },
  jenkins+: {
    staticAgentCount: 4, // => https://gitlab.eclipse.org/eclipsefdn/helpdesk/-/issues/5120
    plugins+: [
      "build-name-setter",
      "mail-watcher-plugin",
      "multiple-scms",
      "zentimestamp",
    ],
    permissions+:
      permissionsTemplates.user("ed.merks@gmail.com", ["Overall/SystemRead"]),
  },
  clouds+: {
    kubernetes+: {
      local currentCloud = self,
      templates+: {
        "jipp-basic-agent-8gb": currentCloud.templates["basic"] {
          labels: ["basic-8gb"],
          kubernetes+: {
            resources+: {
              cpu: {
                limit: "2000m",
                request: "2000m",
              },
              memory: {
                limit: "8Gi",
                request: "8Gi",
              },
            },
          },
        },
      },
    },
  },
  seLinuxLevel: "s0:c50,c0",
  storage: {
    storageClassName: "managed-nfs-storage-bambam-retain-policy",
  }
}
