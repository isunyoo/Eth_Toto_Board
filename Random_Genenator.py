from random import randint

slot_data = []
finalSheet = []

def unique_rand(inicial, limit, total):
    data = []
    i = 0
    while i < total:
        number = randint(inicial, limit)
        if number not in data:
            data.append(number)
            i += 1
    return data

# Input Number of Set
nums = input("How many set to generate: ")  

count = 0
while (count < int(nums)):   
    count = count + 1
    slot_data = unique_rand(1, 49, 6)
    # print(data)
    # sort the list
    slot_data.sort()
    # print(data)
    finalSheet.append(slot_data)
    
print(finalSheet)
print(len(finalSheet))
print(finalSheet[0])
print(len(finalSheet[0]))

for totalidx in range(len(finalSheet)):
    print(finalSheet[totalidx])
    # for idx in range(len(finalSheet[totalidx])):
    #     print(finalSheet[idx])
