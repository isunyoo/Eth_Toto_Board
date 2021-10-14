import json
from web3 import Web3
from datetime import datetime
import utils.Random_Generator as quickPicker
import utils.Ether_Transaction_Query as etherQuery

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
def array_pushTransact(slotsListNums):  
  tx_hash = contract.functions.array_pushData(slotsListNums).transact()
  web3.eth.waitForTransactionReceipt(tx_hash)

# Function to Retrieve Tx results historical data
def txResultHistoryData(query_filename, start_block, end_block, principal_address):
    # Local Lists variables 
    _local_listLength = 0    
    _local_From = []
    _local_To = []
    _local_Nonce = []
    _local_BlockNumber = []
    _local_Hash = []
    _local_BlockHash = []            

    # Reading from JSON file   
    with open(etherQuery.queryEther(query_filename, start_block, end_block, principal_address), 'r') as dataContent:        
            loaded_json = json.load(dataContent)    
            for idx, key in enumerate(loaded_json):                
                _local_From.insert(idx, loaded_json[idx]['from']) 
                _local_To.insert(idx, loaded_json[idx]['to'])                
                _local_Nonce.insert(idx, loaded_json[idx]['nonce'])
                _local_BlockNumber.insert(idx, loaded_json[idx]['blockNumber'])
                _local_Hash.insert(idx, loaded_json[idx]['hash'])
                _local_BlockHash.insert(idx, loaded_json[idx]['blockHash'])               
            _local_listLength = len(_local_From)
    dataContent.close()
    return _local_listLength, _local_From, _local_To, _local_Nonce, _local_BlockNumber, _local_Hash, _local_BlockHash

# Function to trigger txResultHistoryData historical data results
def queryPrincipalInput(fromBlkNum):      
  start_block = int(fromBlkNum)
  end_block = int(format(contract.functions.block_Call().call()))
  listLength, From, To, Nonce, BlockNumber, Hash, BlockHash = txResultHistoryData(web3.eth.defaultAccount, start_block, end_block, web3.eth.defaultAccount)  
  for idx in range(listLength):
    print('From: ', From[idx])
    print('To: ', To[idx])
    print('Nounce: ', Nonce[idx])
    print('BlockNumber: ', BlockNumber[idx])
    print('Hash: ', Hash[idx])
    print('BlockHash: ', BlockHash[idx])
    print('\n')  

# Function to call search jackpot elements in dynamic array 
def array_searchJackPot(jackPotNums):     
  array_data = contract.functions.array_popAllData().call()  
  for idx in range(len(array_data)):  
    res = len([key for key, val in enumerate(array_data[idx]) if val in set(jackPotNums)]);
    print(f'Slot Numbers{array_data[idx]} have {res} matched with JackPot Numbers.')    

# Defining the main function
if __name__ == "__main__":
  # Input Number of Set
  slot_nums = input("How many set to generate: ")  
  slotsList = quickPicker.toto_quickpick_generator(slot_nums)
  print('New quickpick set to be stored in blockchains: ', slotsList)
  # Trigger blockchain transaction to store in arrays  
  # array_pushTransact(slotsList)
  print('Total Array Length: {}'.format(contract.functions.array_getLength().call()))  
  print('All Array Data: {}'.format(contract.functions.array_popAllData().call()))  

  # Input Array Number to retrieve
  array_num = input("Which Array Number to retrieve (Starting from 0): ")      
  print(f'Array Data[{array_num}]: ''{}'.format(contract.functions.array_getArray(int(array_num)).call()))

  # Miscellaneous
  timestamp = int(format(contract.functions.time_Call().call()))
  print('Current Time(UTC):',datetime.utcfromtimestamp(timestamp).strftime('%Y-%m-%d %H:%M:%S'))
  print('Current Block Number: {}'.format(contract.functions.block_Call().call()))

  # Query BlockChain History Transactional Records
  # fromBlkNum = input("From Which Block Number to retrieve records: ")     
  # queryPrincipalInput(fromBlkNum)

  # Input JackPot Number Elements to search results as input  
  print('Input JackPot 6 Numbers to search results: ')
  # creating an empty list
  jackpotList = []
  # Iterating till the range
  index = 0  
  while True:
    inputNums = int(input(f"Please input a JackPot Number{[index+1]}: "))
    if(inputNums==0 or inputNums>45):
      print('JackPot Numbers must between 1 and 45')    
    elif(inputNums not in jackpotList):
      jackpotList.append(inputNums) # adding the element    
      index+=1
      if(index==6): break
    else:             
       jackpotList.sort()
       print(f'{inputNums} already existed and duplicated, and JackPot Number list is {jackpotList}')
  jackpotList.sort()
  print('JackPot 6 Numbers: ', jackpotList)
  array_searchJackPot(jackpotList)


 
