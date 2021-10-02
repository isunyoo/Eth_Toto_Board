// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
  
// Creating a contract 
contract TotoSlots {  
  
    // Declaring state variables of type array        
    // uint[6] private arr_data;    
    int[] private arr_data;    
    // Defining the array
    uint[] data = [10, 20, 30, 40, 50, 60];     
      
    // // Defining function to add values to an array 
    // function array_setData() public returns (uint[6] memory){              
    //     arr_data = [uint(10), 20, 30, 40, 50, 60];            
    //     return arr_data;  
    // }  

    // Defining function to add values to an array 
    function array_setData(int inputArray) public {              
        arr_data.push(inputArray);        
    }      

    // Function to add data in dynamic array 
    function addData(int num) public {
        arr_data.push(num);
    }

    // Function to get data of dynamic array 
    // function array_getData() view public returns(uint[6] memory) {
    function array_getData() view public returns(int[] memory) {
        return arr_data;
    }
  
    // Defining function to access values from the array from a specific index  
    function array_getElement() public payable returns (uint){          
        uint x = data[2];
        return x;  
    }  
    
    // Defining a function to find the length of the array
    function array_getLength() view public returns(uint) {  
        uint x = arr_data.length;
        return x; 
    }     
        
    // Defining the function to push values to the array
    function array_addPush() public returns(uint[] memory) {            
        data.push(70);  
        data.push(80);    
        return data;  
    }  
    
    // Defining a function to pop values from the array
    function array_pop() public returns(uint[] memory) {  
        data.pop(); 
        return data;  
    }  
    
}
