// https://stackoverflow.com/questions/48594840/how-can-i-retrieve-the-data-from-block-in-ethereum-blockchain
// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
  
// Creating a contract 
contract TotoSlots {    
    // Declaring state variables of type array        
    uint[6][] private arr_data;        
    uint256[] private arr_test;    

    event on_success_slot(address userId, string slotId, string emailId);
    // Slots info having these storage values i.e userID, email and slotsData
    struct SlotsInfo{
        address userId;
        string emailId;
        uint[6][] slotsData;     
    }

    // Map for saving all the info, assuming all ticket has unique id as key. Value is ticket info
    mapping(slotId=>SlotsInfo) internal info;
    function Slot() public {
    }

    // Method will save all slot info, and will raise event.
    function onSlotCompleted(address id, string slotId, string emailId) public {
        info[slotId] = SlotsInfo(userId, emailId, slotsData);
        on_success_slot(id, slotId, emailId);
    }

     // Get info by using slotId at any point of time. 
    function getSlotInfo(string slotId) public returns(address, string, uint[6][]){        
       return (info[slotId].userId, info[slotId].emailId, info[slotId].slotsData);
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
