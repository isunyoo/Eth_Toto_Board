https://www.geeksforgeeks.org/solidity-arrays/

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
truffle(development)> totoSlot.array_setData()
truffle(development)> totoSlot.array_setData([10,20,30,40,50,60])
truffle(development)> totoSlot.array_getData()
truffle(development)> totoSlot.array_pop()
truffle(development)> totoSlot.array_element()

truffle(development)> taskCount = await todoList.taskCount()
truffle(development)> taskCount.toNumber()
