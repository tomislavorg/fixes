Corefile
.:53 {

    errors 

    health  {

        lameduck 5s

    }

    ready 

    kubernetes   cluster.local  cluster.local in-addr.arpa ip6.arpa {

        pods insecure

        fallthrough in-addr.arpa ip6.arpa

        ttl 30

    }

    prometheus   0.0.0.0:9153

    forward   . 172.17.0.2:53 ## local dns server (pi.hole) for upstream name resolution 

    cache   30

    loop 

    reload 

    loadbalance 

}
