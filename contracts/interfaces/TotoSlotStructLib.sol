// SPDX-License-Identifier: MIT
// Solidity program to create a fixed-size array 
pragma solidity >0.5.0;
pragma experimental ABIEncoderV2;

library TotoSlotStructLib {

    struct Issuer {        
        address issuerAddress;
        string issuerEmail;
        uint256 createdAt;        
    }
    
    // Defining our TotoSlotData struct
    struct TotoSlotsData {        
        // Declaring different structure elements
        address issuerAddress;
        string issuerEmail;
        uint[6][] slotsData;        
    }

    function isANonEmptyString(string memory stringArgument) public pure returns(bool){
        return bytes(stringArgument).length > 0;
    }

    function isAnEmptyString(string memory stringArgument) public pure returns(bool){
        return bytes(stringArgument).length == 0;
    }

    function isANonEmptyByteValue(bytes memory byteArgument) public pure returns(bool){
        return byteArgument.length > 0;
    }

    function isAValidAddress(address addressArgument) public pure returns(bool){
        return addressArgument != address(0x0);
    }

    function isAValidInteger(uint integerValue) public pure returns(bool){
        return integerValue > 0;
    }     

    function hashCompareWithLengthCheck(string memory a, string memory b) public pure returns (bool) {
        if(bytes(a).length != bytes(b).length) {
            return false;
        } else {
            return keccak256(abi.encode(a)) == keccak256(abi.encode(b));
        }
    }

    function isATrueValue(string memory a) public pure returns (bool) {
        return hashCompareWithLengthCheck(a, "true");
    }

}
