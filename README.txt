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
truffle(development)> totoSlot.array_length()
truffle(development)> totoSlot.array_length().then(function(length) { arrayLength = length})
truffle(development)> arrayLength.words[0]
truffle(development)> totoSlot.array_example()
truffle(development)> totoSlot.array_pop()
truffle(development)> totoSlot.array_element()

truffle(development)> taskCount = await todoList.taskCount()
truffle(development)> taskCount.toNumber()
