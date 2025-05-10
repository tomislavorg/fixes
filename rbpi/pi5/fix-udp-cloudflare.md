 UDP Buffer Optimization Commands

## Temporary Fix
```bash
sudo sysctl -w net.core.rmem_max=7500000
sudo sysctl -w net.core.wmem_max=7500000
```

## Permanent Fix
```bash
sudo nano /etc/sysctl.conf
```
Add these lines:
```
net.core.rmem_max=7500000
net.core.wmem_max=7500000
```
```bash
sudo sysctl -p
```

## Verify
```bash
cat /proc/sys/net/core/rmem_max
cat /proc/sys/net/core/wmem_max
```

## Restart cloudflared
```bash
sudo systemctl restart cloudflared
```

## K3s pod restart
```bash
kubectl get pods -A | grep cloudflared
kubectl delete pod -n NAMESPACE POD_NAME
```

---

These commands increase UDP buffer sizes for Raspberry Pi 5 running K3s with cloudflared to fix the "failed to sufficiently increase receive buffer size" error.
