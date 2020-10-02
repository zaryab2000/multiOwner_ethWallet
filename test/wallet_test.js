const WalletTest = artifacts.require("WalletTest");

contract("WalletTest", function() {
  it("should assert true", async function(done) {
    await WalletTest.deployed();
    assert.isTrue(true);
    done();
  });
});
