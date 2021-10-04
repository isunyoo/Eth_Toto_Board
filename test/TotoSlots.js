const TotoSlots = artifacts.require('./TotoSlots.sol');

contract('TotoSlots', (accounts) => {
  it('initializes with the correct value', async () => {
    const totoSlot = await TotoSlots.deployed()
    const array_value = await totoSlot.array_getArray(0)
    assert.equal(array_value, '[1, 2, 3, 4, 5, 6]')
  })

  it('can update the value', async () => {
    const totoSlot = await TotoSlots.deployed()    
    const array_length = await totoSlot.array_getLength()
    assert.equal(array_length, '6')
  })
})



