// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
  
// Creating a contract 
contract TotoSlots {  
  
    // Declaring state variables of type array            
    uint[6][] private arr_data;    
      
    // Function to add data in dynamic array 
    function array_pushData(uint arr1, uint arr2, uint arr3, uint arr4, uint arr5, uint arr6) public {                        
        arr_data.push([arr1, arr2, arr3, arr4, arr5, arr6]); 
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
    
}
