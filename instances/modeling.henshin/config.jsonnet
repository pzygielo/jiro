local permissionsTemplates = import '../../templates/permissions.libsonnet';

{
  project+: {
    fullName: "modeling.henshin",
    displayName: "Eclipse Henshin"
  },
  jenkins+: {
    permissions:
      permissionsTemplates.group("admins", ["Overall/Administer"]) +
      permissionsTemplates.group("common", ["Overall/Read", "Job/Read", "Job/ExtendedRead"]) +
      permissionsTemplates.group($.project.unixGroupName, permissionsTemplates.committerPermissionsList)
    ,
    plugins+: [
      "github-checks",
      "git-forensics",
    ],
  },
  storage: {
    storageClassName: "cephfs-new-retain",
  },
  seLinuxLevel: "s0:c41,c35",
}
