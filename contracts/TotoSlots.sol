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

    // Function to search elements in dynamic array     
    function search_jackPot(uint[6] memory slotNums) view public returns(uint matchedNum) {
        uint idx;        
        for(idx=0; idx<arr_data.length; idx++) {
            if(arr_data[6][idx] == slotNums[idx]) {
            // if(any(slotNums.count(element) > 1 for element in slotNums)) {
                matchedNum++;
                return matchedNum;
            }            
        }        
        if(idx >= arr_data.length)
        matchedNum = 0;
        return matchedNum;

        // Matching elements count using list comprehension and enumerate() + len()
        // res = len([key for key, val in enumerate(arr_data) if val in set(slotNums)]);
        // res = len([test_list1.index(i) for i in test_list2]);
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
