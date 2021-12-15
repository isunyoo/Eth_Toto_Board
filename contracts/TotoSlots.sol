// https://github.com/kanthgithub/ticketbooking/tree/main/contracts
// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
pragma experimental ABIEncoderV2;
import "./interfaces/TotoSlotStructLib.sol";
  
// Creating a contract 
contract TotoSlots {    

    // Declaring state variables of type array      
    address public owner;  
    uint[6][] private arr_data;        
    uint256[] private arr_test;    

    constructor(
        address _owner
    ) public {
        owner = _owner;
    }

    // Storage variables for Issuers(issuerAddress -> Issuer)
    mapping(address => TotoSlotStructLib.Issuer) public issuerMap;

    // Storage variables for TotoSlotsData
    // ticketId -> TotoSlotsData
    mapping(string => TotoSlotStructLib.TotoSlotsData) public TotoSlotsDataMap;

    // ticketId -> issuerAddress 
    mapping(string => address) public TotoSlotsDataIssuerMap;

    modifier onlyOwner {
        require(msg.sender == owner, "only Owner can invoke the function");
        _;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    modifier isIssuerAuthorised(address issuerAddress){
        require(issuerMap[msg.sender].issuerAddress == issuerAddress , "not Authorized to Invoke the function");
        _;
    }

    modifier isAnIssuerOfAShow(string memory _showId){
         require(showMap[_showId].issuer == msg.sender , "only Show Issuer can invoke the function");
        _;
    }
      
    // Function to add data in dynamic array test
    function addData(uint256 num) public {        
        arr_test.push(num);
    }

    // Function to search an element in dynamic array
    function search(uint256 num) view public returns(bool) {
        uint i;        
        for(i=0; i<arr_test.length; i++) {
            if(arr_test[i] == num) {
                return true;
            }
        }        
        if(i >= arr_test.length)
        return false;
    } 

    // Function to store all data in dynamic array 
    function array_pushData(uint[6][] memory slotListNumbers) public { 
        // Dynamic array outright with its elements are arrays of fixed size
        uint count = slotListNumbers.length;
        arr_data = new uint[6][](count);        
        for(uint idx=0; idx<count; idx++) { 
            arr_data[idx] = slotListNumbers[idx];           
        }                                            
    }          

    // Function to get all data of dynamic array 
    function array_popAllData() view public returns(uint[6][] memory) {    
        return arr_data;
    }

    // Defining a function to find the length of the array
    function array_getLength() view public returns(uint256) {  
        uint x = arr_data.length;
        return x; 
    }  

    // Return an array stored in the dynamic dimension will throw if index > flags.length-1 (index starts at 0)
    function array_getArray(uint256 index) view public returns(uint[6] memory) {
        return(arr_data[index]);
    }   
     
    // Current block timestamp is returned by now (http://www.unixtimestamp.com/)
    function time_Call() view public returns(uint256) {        
        return block.timestamp;
    }

    // Block Number is returned using block.number
    function block_Call() view public returns(uint256) {
        return block.number; 
    }
    
}
