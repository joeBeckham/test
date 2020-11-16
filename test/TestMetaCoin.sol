pragma solidity ^0.5.16;

import "truffle/Assert.sol"; // 断言库
import "truffle/DeployedAddresses.sol"; // 获取被测试合约的地址
import "../contracts/MetaCoin.sol";   // 被测试合约

// 测试用例
contract TestMetaCoin {

  function testInitialBalanceUsingDeployedContract() public {
    // 实例化对象
    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    uint expected = 10000;
    // 使用断言判断是否和10000相等
    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

  function testInitialBalanceWithNewMetaCoin() public {
    MetaCoin meta = new MetaCoin();

    uint expected = 10000;
   // 使用断言判断是否和10000相等
    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

}
