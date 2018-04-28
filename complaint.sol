pragma solidity ^0.4.17;

contract Complaint {

    // Declare data structures
    struct Complaint {
      address addr;
      string public url;
      string public zipcode;
      string public time;
      string public speed;
      string public isp;
    }
    // Maps urls to complaints
    mapping(string => Complaint) public complaints;

    // Method to create complaints
    function createComplaint(
      string _url,
      string _zipcode,
      string _time,
      string _speed,
      string _isp
    ) public {
        Complaint c = Complaint(_url, _zipcode, _time, _speed, _isp);
        complaints[url_in] = c;
    }

    function getUrlComplaint(string url) public view returns (Complaint) {
        return complaints[url];
    }
}
