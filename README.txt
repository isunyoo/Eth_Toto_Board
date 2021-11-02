Reference
https://kalis.me/check-events-solidity-smart-contract-test-truffle/
https://medium.com/geekculture/simple-dapp-using-flutter-and-solidity-b64f5267acf4

$ npm install --save-dev @truffle/hdwallet-provider

$ truffle init
$ truffle compile
$ truffle test
$ truffle migrate
$ truffle migrate --reset --compile-all --network development/ropsten
$ truffle console --network development/ropsten
truffle(development)> networks
truffle(development)> totoSlot = await TotoSlots.deployed()
truffle(development)> totoSlot
truffle(development)> totoSlot.address
truffle(development)> totoSlot.array_getLength()
truffle(development)> totoSlot.array_getLength().then(function(length){arrayLength = length})
truffle(development)> arrayLength.words[0]
truffle(development)> totoSlot.array_pushData([1,2,3,4,5,6])
truffle(development)> totoSlot.array_popAllData()
truffle(development)> totoSlot.array_getLength()
truffle(development)> totoSlot.array_getArray(0)
truffle(development)> totoSlot.search(11)
