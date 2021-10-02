const TotoSlots = artifacts.require('./TotoSlots.sol');

contract('TotoSlots', (accounts) => {
  it('initializes with the correct value', async () => {
    const totoSlot = await TotoSlots.deployed()
    const value = await totoSlot.array_setData(77)
    // assert.equal(value, '77')
  })

  it('can update the value', async () => {
    const totoSlot = await TotoSlots.deployed()
    // totoSlot.set('Hello There!');
    const value = await totoSlot.array_getLength()
    assert.equal(value, '1')
  })
})