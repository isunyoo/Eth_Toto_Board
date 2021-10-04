from random import randint

slot_data = []
finalSheet = []

# Function to generate random numbers
def unique_rand(inicial, limit, total):
    data = []
    i = 0
    while i < total:
        number = randint(inicial, limit)
        if number not in data:
            data.append(number)
            i += 1
    return data

# Function to sort 6 numbers between 1 and 45
def toto_quickpick_generator(set_num):
    count = 0
    while (count < int(set_num)):   
        count = count + 1
        slot_data = unique_rand(1, 45, 6)
        # print(slot_data)
        # Sorting the list by number orders
        slot_data.sort()
        # print(slot_data.sort())
        finalSheet.append(slot_data)
    return finalSheet
    
if __name__ == "__main__":
    # Input Number of Set
    nums = input("How many set to generate: ")  
    toto_quickpick_generator(nums)

    # Print Output       
    print(finalSheet)
    print(len(finalSheet))
    print(finalSheet[0])
    print(len(finalSheet[0]))

    for totalIdx in range(len(finalSheet)):
        print(finalSheet[totalIdx])
        for arrayIdx in range(len(finalSheet[totalIdx])):
            print(finalSheet[totalIdx][arrayIdx])