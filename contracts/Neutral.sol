pragma solidity ^0.4.17;

contract Neutral {

    // Declare data structures
    struct Connection {
        string ip_src;
        string ip_dest;
        string latency;
        string timestamp;
    }
    Connection[] public connections;
    uint counter = 0;

    // Method to create complaints
    function saveConnection(
      string _ip_src,
      string _ip_dest,
      string _latency,
      string _timestamp
    ) public {
        connections.push(Connection(_ip_src, _ip_dest, _latency, _timestamp));
        counter++;
    }

    function getConnection(uint idx) public view returns (string, string, string, string) {
        require(idx <= counter);
        return (connections[idx].ip_src, connections[idx].ip_dest, connections[idx].latency, connections[idx].timestamp);
    }
}
