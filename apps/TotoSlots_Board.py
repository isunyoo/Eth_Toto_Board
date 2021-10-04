import json
from web3 import Web3
import utils.Random_Generator as quickPicker

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

# Function to contract data in dynamic array 
def array_pushTransact(num1, num2, num3, num4, num5, num6):  
  tx_hash = contract.functions.array_pushData(num1, num2, num3, num4, num5, num6).transact()
  web3.eth.waitForTransactionReceipt(tx_hash)

if __name__ == "__main__":
  # Input Number of Set
  nums = input("How many set to generate: ")  
  print(quickPicker.toto_quickpick_generator(nums))
  print(len(quickPicker.toto_quickpick_generator(nums)))
  print('Total Array Length: {}'.format(contract.functions.array_getLength().call()))
  print('Array Data[0]: {}'.format(contract.functions.array_getArray(0).call()))
  print('All Array Data: {}'.format(contract.functions.array_popAllData().call()))
