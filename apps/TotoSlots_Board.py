import json
from web3 import Web3

ganache_url = "http://localhost:8545" 
web3 = Web3(Web3.HTTPProvider(ganache_url))
web3.eth.defaultAccount = web3.eth.accounts[0]

# Opening JSON file and returns JSON object as a dictionary
with open('../build/contracts/TotoSlots.json') as f:  
  info_json = json.load(f)
ABI = info_json["abi"]
BYTECODE = info_json["bytecode"]
CONTRACT_ADDRESS = info_json["networks"]["4447"]["address"]
# print("abi file: ", ABI)  
# print("contract address: ", CONTRACT_ADDRESS)
contract = web3.eth.contract(address=CONTRACT_ADDRESS, abi=ABI, bytecode=BYTECODE)

tx_hash = contract.functions.array_pushData(21,22,23,24,25,26).transact()
web3.eth.waitForTransactionReceipt(tx_hash)

print('Total Array Length: {}'.format(contract.functions.array_getLength().call()))
print('Array Data[0]: {}'.format(contract.functions.array_getArray(0).call()))
print('All Array Data: {}'.format(contract.functions.array_popAllData().call()))
