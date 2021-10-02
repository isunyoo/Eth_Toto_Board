// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
  
// Creating a contract 
contract TotoSlots {  
  
    // Declaring state variables of type array
    uint[6] data1;    
    // Defining the array
    uint[] data = [10, 20, 30, 40, 50, 60];
      
    // Defining function to add values to an array 
    function array_example() public returns (uint[6] memory){              
        data1 = [uint(10), 20, 30, 40, 50, 60];            
        return data1;  
  }  
  
  // Defining function to access values from the array from a specific index  
  function array_element() public payable returns (uint){  
        uint x = data[2];
        return x;  
  }  
  
  // Defining a function to find the length of the array
  function array_length() public view returns(uint) {  
        uint x = data.length;
        return x; 
    } 
    
  // Defining the function to push values to the array
  function array_push() public returns(uint[] memory){            
      data.push(70);  
      data.push(80);    
      return data;  
  }  
  
  // Defining a function to pop values from the array
  function array_pop() public returns(uint[] memory){  
      data.pop(); 
      return data;  
  }  
    
}
