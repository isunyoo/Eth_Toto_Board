// https://github.com/kanthgithub/ticketbooking/tree/main/contracts
// https://jeancvllr.medium.com/solidity-tutorial-all-about-structs-b3e7ca398b1e
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
import "./interfaces/TotoSlotStructLib.sol";
  
// Creating a contract 
contract TotoSlots {    

    // Declaring state variables of a type of fixed-size array 
    address private owner;  
    uint[6][] private arr_data;        
    uint256[] private arr_test;    
    
    // Storage variables for Issuers(issuerAddress -> Issuer)
    mapping(address => TotoSlotStructLib.Issuer) issuerMap;

    // Creating mapping    
    mapping(address => TotoSlotStructLib.TotoSlotsData) totoSlots;       

    // Save all the Slot‘s addresses who registered on a contract in an array.
    address[] public slotAccounts;    
    // TotoSlotStructLib.TotoSlotsData[] public slotAccounts;        

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
    
    // Function adding values to the mapping
    function setTotoSlotsData(address _address, string memory _issuerUID, string memory _issuerName, string memory _issuerEmail, uint[6][] memory _slotsData) public {  
        totoSlots[_address] = TotoSlotStructLib.TotoSlotsData(
            {
                issuerAddress: _address,
                issuerUID: _issuerUID,
                issuerName: _issuerName,
                issuerEmail: _issuerEmail,
                slotsData: _slotsData,
                createdAt : block.timestamp
            }
        );
        
        // Create a request instance        
        slotAccounts.push(_address);       
    }

    // Function to get all data of dynamic array 
    function getTotoSlotsData(address _inputAddress) view public returns (address, string memory, string memory, string memory, uint[6][] memory, uint256) { 
        address _address = totoSlots[_inputAddress].issuerAddress;
        string memory _uid = totoSlots[_inputAddress].issuerUID;
        string memory _name = totoSlots[_inputAddress].issuerName;
        string memory _email = totoSlots[_inputAddress].issuerEmail;
        uint[6][] memory _slotsData = totoSlots[_inputAddress].slotsData;
        uint256 _createdAt = totoSlots[_inputAddress].createdAt;

        return (_address, _uid, _name, _email, _slotsData, _createdAt);
    }    

    // Counting dynamic array from a Mapping
    function countSlotAccounts() view public returns (uint) {
        return slotAccounts.length;
    }

    // Function to get all stored addresses of dynamic array 
    function getSlotAccounts() view public returns (address[] memory) {
        return slotAccounts;
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
    function array_popAllData() view public returns (uint[6][] memory) {    
        return arr_data;
    }

    // Defining a function to find the length of the array
    function array_getLength() view public returns (uint256) {  
        uint x = arr_data.length;
        return x; 
    }  

    // Return an array stored in the dynamic dimension will throw if index > flags.length-1 (index starts at 0)
    function array_getArray(uint256 index) view public returns (uint[6] memory) {
        return(arr_data[index]);
    }   
     
    // Current block timestamp is returned by now (http://www.unixtimestamp.com/)
    function time_Call() view public returns (uint256) {        
        return block.timestamp;
    }

    // Block Number is returned using block.number
    function block_Call() view public returns (uint256) {
        return block.number; 
    }
    
}
