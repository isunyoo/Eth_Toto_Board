// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
  
// Creating a contract 
contract TotoSlots {  
  
    // Declaring state variables of type array            
    uint[6][] private arr_data;    
      
    // Function to add data in dynamic array 
    function array_pushData(uint count, uint arr0, uint arr1, uint arr2, uint arr3, uint arr4, uint arr5) public { 
        // Single Array to store all sub-arrays
        // arr_data = new uint[6][];
        // arr_data.push([arr0, arr1, arr2, arr3, arr4, arr5]);        
        
        // Dynamic array outright with its elements are arrays of fixed size
        arr_data = new uint[6][](count);
        for(uint idx=0; idx<count; idx++) {                    
            arr_data[idx] = [arr0, arr1, arr2, arr3, arr4, arr5];                    
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
