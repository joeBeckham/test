// SPDX-License-Identifier: MIT
pragma solidity ^0.5.16;

/**
  * library表示类库
 */
library ConvertLib{

	/**
	 * 对代币进行转换，conversionRate类似于汇率
	 */
	function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}
