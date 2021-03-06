import json, binascii
from web3 import Web3
from datetime import datetime
import utils.Random_Generator as quickPicker
import utils.Ether_Transaction_Query as etherQuery


# Opening JSON file and returns JSON object as a dictionary
with open('../secrets.json') as keyfile:  
  info_json = json.load(keyfile)
projectId = info_json["projectId"]
keystoreFile = info_json["keystoreFile"]
accountKey = info_json["accountKey"]
keyfile.close


ganache_http = "http://localhost:8545" 
# web3 = Web3(Web3.HTTPProvider(ganache_http))
# web3.eth.defaultAccount = web3.eth.accounts[0]  
# Interactions with an HTTP or HTTPS based JSON-RPC server.
# ropsten_https = "https://ropsten.infura.io/v3/"+projectId
# web3 = Web3(Web3.HTTPProvider(ropsten_https))
# Interactions with an WS or WSS based JSON-RPC server.
ropsten_wss = "wss://ropsten.infura.io/ws/v3/"+projectId
web3 = Web3(Web3.WebsocketProvider(ropsten_wss, websocket_timeout=60))

# tip: do not save the key or password anywhere, especially into a shared source file
with open(keystoreFile) as keyfile:  
  # encrypted_key = keyfile.read()
  # private_key = web3.eth.account.decrypt(encrypted_key, privateKey)
  info_json = json.load(keyfile)
  web3.eth.defaultAccount = web3.toChecksumAddress(info_json["address"])  
  cipher = info_json["crypto"]["ciphertext"]  
  keyfile.close  
with open(keystoreFile) as keyfile:
  encrypted_key = keyfile.read()
  decrypted_key = web3.eth.account.decrypt(encrypted_key, accountKey)
  private_key = binascii.b2a_hex(decrypted_key)  
  keyfile.close


# Opening JSON file and returns JSON object as a dictionary
with open('../build/contracts/TotoSlots.json') as keyfile:  
  info_json = json.load(keyfile)
  ABI = info_json["abi"]
  BYTECODE = info_json["bytecode"]
  # Development Network
  # CONTRACT_ADDRESS = info_json["networks"]["4447"]["address"]
  # Ropsten Network
  CONTRACT_ADDRESS = info_json["networks"]["3"]["address"]
  # print("abi file: ", ABI)  
  # print("contract address: ", CONTRACT_ADDRESS)
  contract = web3.eth.contract(address=CONTRACT_ADDRESS, abi=ABI, bytecode=BYTECODE)
  keyfile.close


# Function to contract data in dynamic array 
def array_pushTransact(slotsListNums):  
  # Development builds a transaction dictionary based on the contract function call(Transaction Object)
  # tx = contract.functions.array_pushData(slotsListNums).transact()
  # web3.eth.waitForTransactionReceipt(tx)

  # Ropsten builds a transaction dictionary based on the contract function call(Transaction Object)
  tx = contract.functions.array_pushData(slotsListNums).buildTransaction({'nonce': web3.eth.getTransactionCount(web3.eth.defaultAccount)})
  # Sign the transaction  
  signed_tx = web3.eth.account.signTransaction(tx, private_key.decode('ascii'))
  # Send Signed Transaction
  tx_hash = web3.eth.sendRawTransaction(signed_tx.rawTransaction)  
  tx_receipt = web3.eth.waitForTransactionReceipt(tx_hash)    
  timestamp = int(format(contract.functions.time_Call().call()))  
  tx_receipt_data = {}
  tx_receipt_data['tx_receipt'] = []
  tx_receipt_data['tx_receipt'].append({
    'blockNumber': str(tx_receipt['blockNumber']),
    'transactionHash': web3.toHex(tx_receipt['transactionHash']),
    'transactionTime(UTC)': datetime.utcfromtimestamp(timestamp).strftime('%Y-%m-%d %H:%M:%S'),
    'from': tx_receipt['from'],
    'to': tx_receipt['to']
  })
  # Writing Signed Transaction to a JSON File
  with open('../static/query/tx_receipts.json', 'w') as outfile:    
    json.dump(tx_receipt_data, outfile)
    outfile.close
   

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

# Function to decode input data from txhash which has transacted previously
def queryTransactedInput(txhash):  
  tx = web3.eth.getTransaction(txhash)
  func_obj, func_params = contract.decode_function_input(tx["input"])
  # print(func_obj)
  # print(type(func_obj))
  print(func_params)
  # print(type(func_params))

# Defining the main function
if __name__ == "__main__":
  # Currently Stored Number of Set in BlockChain
  print('Current Stored Slot Data in BlockChain: ')
  print('Total Array Length: {}'.format(contract.functions.array_getLength().call()))  
  print('All Array Data: {}'.format(contract.functions.array_popAllData().call()))      
  # Reading Signed Transaction from a JSON File
  with open('../static/query/tx_receipts.json') as json_file:
    tx_data = json.load(json_file)
    for tx in tx_data['tx_receipt']:
        print('Transacted BlockNumber: ' + tx['blockNumber'])
        print('https://ropsten.etherscan.io/block/'+ tx['blockNumber'])
        print('Transacted Hash: ' + tx['transactionHash'])
        print('https://ropsten.etherscan.io/tx/' + tx['transactionHash'])
        print('transacted Time(UTC): ' + tx['transactionTime(UTC)'])        
        print('From: ' + tx['from'])
        print('To: ' + tx['to'])
        print('')
    json_file.close

  # Decode transacted input data from historical txhash info
  txhash_data = input("Input txhash to retrieve previous stored input data (ex, 0x4cef6853dd6cd2d79fb5537d0f14caca86d13bbed1d5920e6c9c550df9b2fb5b)\n : ") 
  queryTransactedInput(txhash_data)

  # Input Number of Set
  slot_nums = input("How many new set to generate: ")  
  slotsList = quickPicker.toto_quickpick_generator(slot_nums)
  print('New quickpick set to be stored in blockchains: ', slotsList)
  # Trigger blockchain transaction to store in arrays  
  array_pushTransact(slotsList)
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
 
