# Longhorn XFS Mount Failure

## Symptom
Pod stuck in `ContainerCreating` with:
```
MountVolume.MountDevice failed: mount failed: exit status 32
Structure needs cleaning
```

## Fix
On the node where the volume is scheduled:
```bash
sudo xfs_repair -L /dev/longhorn/<pvc-name>
sudo umount /mnt  # if you mounted it to test
```

Restart the workload if needed. The pod will mount cleanly after repair.

## Notes
- `-L` destroys the unclean journal log — safe when data loss is acceptable (e.g. MinIO state/logs)
- Caused by unclean unmount leaving XFS log dirty
- Deleting the Longhorn `lhva` CRD does not fix this — the XFS corruption is on the block device itself
