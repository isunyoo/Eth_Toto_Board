Reference
https://kalis.me/check-events-solidity-smart-contract-test-truffle/
https://medium.com/geekculture/simple-dapp-using-flutter-and-solidity-b64f5267acf4

$ npm install --save-dev @truffle/hdwallet-provider
$ npm install

$ truffle init
$ truffle compile
$ truffle test
$ truffle migrate
$ truffle migrate --reset --compile-all --network development/ropsten
$ truffle console --network development/ropsten
truffle(development)> accounts
truffle(development)> accounts[0] = accounts[1]
truffle(development)> networks
truffle(development)> blockNum = await web3.eth.getBlockNumber()
truffle(development)> block = await web3.eth.getBlock(blockNum)
truffle(development)> block['timestamp']
$ date -d @'timestamp'
truffle(development)> totoSlot = await TotoSlots.deployed()
truffle(development)> totoSlot
truffle(development)> totoSlot.address
truffle(development)> totoSlot.contractArtifact.networks.[networkId].transactionHash
truffle(development)> totoSlot.array_getLength()
truffle(development)> totoSlot.array_getLength().then(function(length){arrayLength = length})
truffle(development)> arrayLength.words[0]
truffle(development)> totoSlot.array_pushData([[15, 17, 27, 31, 33, 41], [15, 20, 27, 36, 38, 41], [3, 9, 17, 19, 20, 26], [3, 8, 16, 21, 28, 32]])
truffle(development)> totoSlot.setTotoSlotsData('0x8BB0412fcd5Cb1a190b38db667539cC6301890e1', 'xIp3Wv6bb0QKsLcva3bsUjitMR13', 'il sun Yoo', 'example@test.com', [[15, 17, 27, 31, 33, 41], [3, 8, 16, 21, 28, 32]])
truffle(development)> totoSlot.getSlotAccounts()
truffle(development)> totoSlot.countSlotAccounts()
truffle(development)> totoSlot.getTotoSlotsData('0x8BB0412fcd5Cb1a190b38db667539cC6301890e1')
truffle(development)> totoSlot.array_popAllData()
truffle(development)> totoSlot.array_getLength()
truffle(development)> totoSlot.array_getArray(0)
truffle(development)> totoSlot.search(11)
truffle(development)> web3.eth.getTransaction('txhash')
truffle(development)> web3.eth.getTransactionReceipt('txhash')

$ geth account list
$ geth account list --keystore ~/.ethereum/development/keystore/
$ date -d @block.timestamp
$ docker exec -it 92490346e49b date
