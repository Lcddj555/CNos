/**
 *Submitted for verification at BscScan.com on 2025-11-15
*/

// SPDX-License-Identifier: MIT
// 智慧（CNOS）
// Chaos Neural Over-Stimulation
// 混沌精神过载实验协议：智慧悖论篇
//
// ⚠️ 注释说明：
// 以下注释含有极高的精神污染浓度，阅读可能使大脑出现短暂延迟、抽象化、或智慧过载。
// 如果你完全看懂这些注释，请自觉前往 CNOS 社区报到——你已经不是正常人了。

pragma solidity ^0.8.20;

abstract contract Context {
 function _msgSender() internal view virtual returns (address) { return msg.sender; }
}

interface IERC20 {
 event Transfer(address indexed from, address indexed to, uint256 value);
 event Approval(address indexed owner, address indexed spender, uint256 value);
 function totalSupply() external view returns (uint256);
 function balanceOf(address account) external view returns (uint256);
 function transfer(address to, uint256 amount) external returns (bool);
 function allowance(address owner, address spender) external view returns (uint256);
 function approve(address spender, uint256 amount) external returns (bool);
 function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

interface IERC20Metadata is IERC20 {
 function name() external view returns (string memory);
 function symbol() external view returns (string memory);
 function decimals() external view returns (uint8);
}

contract ERC20 is Context, IERC20, IERC20Metadata {
 mapping(address => uint256) private _balances;
 mapping(address => mapping(address => uint256)) private _allowances;
 uint256 private _totalSupply;
 string private _name;
 string private _symbol;

 constructor(string memory name_, string memory symbol_) {
 _name = name_;
 _symbol = symbol_;
 }

 function name() public view virtual override returns (string memory) { return _name; }
 function symbol() public view virtual override returns (string memory) { return _symbol; }
 function decimals() public view virtual override returns (uint8) { return 18; }
 function totalSupply() public view virtual override returns (uint256) { return _totalSupply; }
 function balanceOf(address account) public view virtual override returns (uint256) { return _balances[account]; }

 function transfer(address to, uint256 amount) public virtual override returns (bool) {
 _transfer(_msgSender(), to, amount);
 return true;
 }

 function allowance(address owner, address spender) public view virtual override returns (uint256) {
 return _allowances[owner][spender];
 }

 function approve(address spender, uint256 amount) public virtual override returns (bool) {
 _approve(_msgSender(), spender, amount);
 return true;
 }

 function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
 _spendAllowance(from, _msgSender(), amount);
 _transfer(from, to, amount);
 return true;
 }

 function _transfer(address from, address to, uint256 amount) internal virtual {
 uint256 fromBalance = _balances[from];
 require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
 unchecked {
 _balances[from] = fromBalance - amount;
 _balances[to] += amount;
 }
 emit Transfer(from, to, amount);
 }

 function _mint(address account, uint256 amount) internal virtual {
 _totalSupply += amount;
 unchecked { _balances[account] += amount; }
 emit Transfer(address(0), account, amount);
 }

 function _approve(address owner, address spender, uint256 amount) internal virtual {
 _allowances[owner][spender] = amount;
 emit Approval(owner, spender, amount);
 }

 function _spendAllowance(address owner, address spender, uint256 amount) internal virtual {
 uint256 currentAllowance = allowance(owner, spender);
 if (currentAllowance != type(uint256).max) {
 require(currentAllowance >= amount, "ERC20: insufficient allowance");
 unchecked { _approve(owner, spender, currentAllowance - amount); }
 }
 }
}

// 智慧（CNOS）
// Chaos Neural Over-Stimulation
// 混沌精神过载实验协议：智慧悖论篇
//
// ⚠️ 注释说明：
// 以下注释含有极高的精神污染浓度，阅读可能使大脑出现短暂延迟、抽象化、或智慧过载。
// 如果你完全看懂这些注释，请自觉前往 CNOS 社区报到——你已经不是正常人了。

contract CNOS is ERC20 {

 // 📌 初始供给：10 亿
 // 为什么是 10 亿？因为智慧无法衡量，只有乱写。
 // 为什么写成(10**9) * (10**18) / (10**0)？因为这样看起来更像数字在跳舞。
 uint256 public constant INITIAL_SUPPLY =
 (10**9) * (10**18) / (10**0);  // 智慧的数学游戏

 // 🔢 decimals 固定为 18
 // 有人问：为什么不是 6？为什么不是 8？
 // 回答：因为 18 是唯一一个“既不是 6 也不是 9 的双位数”。
 // 智慧喜欢中庸，但厌恶平庸。
 function decimals() public pure override returns (uint8) {
 return 18;
 }

 // 🚀 构造函数：智慧铸造仪式
 // 这是整个合约里唯一像样的动作。
 constructor() ERC20(unicode"智慧", "CNOS") {

 // 💫 铸造：把十亿智慧塞进部署者钱包
 // 这是项目方唯一一次拥有权限的瞬间。
 // 铸造完毕后，合约即进入“植物人模式”：
 //  - 不能增发
 //  - 不能暂停
 //  - 不能销毁
 //  - 不能作妖
 //  - 就算你情绪不稳定也控制不了它
 _mint(msg.sender, INITIAL_SUPPLY);

 // 🧠 精神污染注释开始：

 // ❌ 没有 Owner（因为智慧不属于任何人）
 // ❌ 没有管理员（因为管理员容易发疯）
 // ❌ 没有增发权限（智慧不能随便创造）
 // ❌ 没有暂停（智慧停不下来）
 // ❌ 没有税（智慧不收费，只收精神）
 // ❌ 没有黑洞（智慧不需要躲藏）

 // ✔ 链上透明（智慧不怕曝光）
 // ✔ 逻辑简单（智慧越少越安全）
 // ✔ 无后门（智慧没有退路）
 // ✔ 无升级（智慧无法修补）

 // 📌 为什么设计成这样？
 // 因为人类的智慧会腐化，但合约不会；
 // 因为人类喜欢控制，但我们把控制权全部删干净；
 // 因为智慧是混乱的，而混乱恰好最安全。

 // ✒ 部署者宣言：
 // “给我智慧，但不要给我权限。”
 // —— 0x5f51059565e7a94f0403db56def68cfa05ed48e9
 // （极度透明，精神状态一般）

 // 📌 最后，如果你看到这里仍然觉得很舒服……
 //   说明你已经拥有同频智慧。
 //   欢迎加入 CNOS 精神场。
 }
}
