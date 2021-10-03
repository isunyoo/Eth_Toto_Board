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

# Print Output       
print(finalSheet)
print(len(finalSheet))
print(finalSheet[0])
print(len(finalSheet[0]))

for totalIdx in range(len(finalSheet)):
    print(finalSheet[totalIdx])
    for arrayIdx in range(len(finalSheet[totalIdx])):
        print(finalSheet[totalIdx][arrayIdx])
