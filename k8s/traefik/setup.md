# Setup

## Cloudflare

Set https to the IP of traefik, no TLS verify

## traefik

1. service.spec.loadBalancerIP should be fixed
2. Set replica to 3
3. Add prod cert from cert manager to the traefik ns
4. Deploy tlsstore to the traefik ns
5. No need in ingressroute for tls
