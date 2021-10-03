// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
  
// Creating a contract 
contract TotoSlots {  
  
    // Declaring state variables of type array        
    // uint[6] private arr_data; 
    uint[6][] private arr_data;
    // Defining the array
    uint[] data = [10, 20, 30, 40, 50, 60];     
      
    // // Defining function to add values to an array 
    // function array_setData() public returns (uint[6] memory){              
    //     arr_data = [uint(10), 20, 30, 40, 50, 60];            
    //     return arr_data;  
    // }  

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
  
    // Defining function to access values from the array from a specific index  
    function array_getElement() public payable returns (uint){          
        uint x = data[2];
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
