Reference
https://www.geeksforgeeks.org/solidity-arrays/
https://ethereum.stackexchange.com/questions/11870/create-a-two-dimensional-array-in-solidity
https://jeancvllr.medium.com/solidity-tutorial-all-about-array-efdff4613694
https://hackernoon.com/arrays-in-solidity-b65c1326f48b
https://ethereum.stackexchange.com/questions/1527/how-to-delete-an-element-at-a-certain-index-in-an-array/1528

$ truffle init
$ truffle compile
$ truffle test
$ truffle migrate
$ truffle migrate --reset --compile-all --network development
$ truffle console
truffle(development)> networks
truffle(development)> totoSlot = await TotoSlots.deployed()
truffle(development)> totoSlot
truffle(development)> totoSlot.address
truffle(development)> totoSlot.array_getLength()
truffle(development)> totoSlot.array_getLength().then(function(length){arrayLength = length})
truffle(development)> arrayLength.words[0]
truffle(development)> totoSlot.array_pushData([10,20,30,40,50,60])
truffle(development)> totoSlot.array_popAllData()
truffle(development)> totoSlot.array_getLength()
truffle(development)> totoSlot.array_getArray(0)
