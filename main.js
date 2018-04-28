// Instantiate globals
var ips = ["172.217.15.110",
            "31.13.69.228",
            "192.30.253.112",
            "104.207.244.40",
            "104.25.46.22"];
const Traceroute = require('traceroute');

// Success callback
let successTraceroute = function(err, hops) {
  if (!err) {
    // Check at least 1 hop
    if (hops.length < 2) {
      return;
    }

    for (let i = 1; i < hops.length; ++i) {
      if (hops[i-1] != false && hops[i] != false) {
        let ip_src = Object.keys(hops[i-1])[0];
        let ip_dest = Object.keys(hops[i])[0];
        let latency = hops[i][ip_dest][0];
        console.log(ip_src, ip_dest, latency);
      }
    }
  }
}

// Trace IPs
for (let i = 0; i < ips.length; ++i) {
  Traceroute.trace(ips[i], successTraceroute);
}
