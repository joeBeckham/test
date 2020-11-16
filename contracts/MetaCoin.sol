// SPDX-License-Identifier: MIT
pragma solidity ^0.5.16;

// 通过import关键字导入外部类库ConvertLib
import "./ConvertLib.sol";

/**
 * MetaCoin代币合约
 */
contract MetaCoin {

	// 用户的余额
	mapping (address => uint) balances;

	// 转账事件
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	// 构造函数，往合约的创始人账号里打10000个MetaCoin
	constructor() public {
		balances[tx.origin] = 10000;
	}

	/**
	  * 转账方法
	  * @param receiver 转账接收人地址
	  * @param amount	转账数量
	  * @return 返回值是bool，表示成功或者失败
	 */
	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		// 判断发送人是否有足够的余额
		if (balances[msg.sender] < amount) return false;
		// 转账发起人 扣减amount
		balances[msg.sender] -= amount;
		// 转账接收人 增加amount
		balances[receiver] += amount;
		// 触发转账事件
		emit Transfer(msg.sender, receiver, amount);
		return true;
	}

	/**
	  * 获取某个地址用户的余额方法，并且转换将MetaCoin代币转换为以太币
	  * @param addr 用户地址
	  * @return 返回值是uint，表示用户余额
	 */
	function getBalanceInEth(address addr) public view returns(uint){
		return ConvertLib.convert(getBalance(addr),2);
	}

	/**
	  * 获取某个地址用户的MetaCoin代币余额
	  * @param addr  用户地址
	  * @return 返回值是uint，表示用户余额
	 */
	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}
