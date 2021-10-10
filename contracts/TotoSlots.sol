// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
  
// Creating a contract 
contract TotoSlots {    
    // Declaring state variables of type array    
    uint[6][] private arr_data;            

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
    function array_getLength() view public returns(uint) {  
        uint x = arr_data.length;
        return x; 
    }  

    // Return an array stored in the dynamic dimension will throw if index > flags.length-1 (index starts at 0)
    function array_getArray(uint index) view public returns(uint[6] memory) {
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
