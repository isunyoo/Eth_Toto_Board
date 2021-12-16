// https://github.com/kanthgithub/ticketbooking/tree/main/contracts
// https://jeancvllr.medium.com/solidity-tutorial-all-about-structs-b3e7ca398b1e
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
pragma experimental ABIEncoderV2;
import "./interfaces/TotoSlotStructLib.sol";
  
// Creating a contract 
contract TotoSlots {    

    // Declaring state variables of a type of fixed-size array 
    address public owner;  
    uint[6][] private arr_data;        
    uint256[] private arr_test;    
    
    // // Storage variables for Issuers(issuerAddress -> Issuer)
    // mapping(address => TotoSlotStructLib.Issuer) public issuerMap;

    // // Storage variables for TotoSlotsData
    // // ticketId -> TotoSlotsData
    // mapping(string => TotoSlotStructLib.TotoSlotsData) public TotoSlotsDataMap;

    // // ticketId -> issuerAddress 
    // mapping(string => address) public TotoSlotsDataIssuerMap;

    // modifier onlyOwner {
    //     require(msg.sender == owner, "only Owner can invoke the function");
    //     _;
    // }

    // function getOwner() public view returns(address){
    //     return owner;
    // }

    // modifier isIssuerAuthorised(address issuerAddress){
    //     require(issuerMap[msg.sender].issuerAddress == issuerAddress , "not Authorized to Invoke the function");
    //     _;
    // }
       
    // Creating mapping    
    mapping (address => TotoSlotStructLib.TotoSlotsData) totoSlots;
    address[] public slotAccounts;
    // TotoSlotStructLib.TotoSlotsData[] public slotAccounts;
    
    // Function adding values to the mapping
    function setTotoSlotsData(address _address, string memory _issuerEmail, uint[6][] memory _slotsData) public {        
        // TotoSlotStructLib.TotoSlotsData memory newSlotData = TotoSlotStructLib.TotoSlotsData({
        //     issuerAddress: _address,
        //     issuerEmail: _issuerEmail,
        //     slotsData: _slotsData           
        // });
 
        // // Create a request instance
        // slotAccounts.push(newSlotData);    

        TotoSlotStructLib.TotoSlotsData memory newSlotData = totoSlots[_address];
        newSlotData.issuerAddress = _address;
        newSlotData.issuerEmail = _issuerEmail;
        newSlotData.slotsData = _slotsData;

        // Create a request instance
        slotAccounts.push(_address);        
    }

    function getslotAccountsAddress() view public returns(address) {         
        for(uint i=0; i<=slotAccounts.length; i++){            
            return slotAccounts[i];
        }
    }

    // Function to get all data of dynamic array 
    function getTotoSlotsData(address _address) view public returns(address, string memory, uint[6][] memory) { 
        address _issuerAddress = totoSlots[_address].issuerAddress;
        string memory _issuerEmail = totoSlots[_address].issuerEmail;
        uint[6][] memory _slotsData = totoSlots[_address].slotsData;
             
        return (_issuerAddress, _issuerEmail, _slotsData);
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
