pragma solidity ^0.4.4;


contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

contract Gateway is Ownable {

  address public MainLogicContractAddress;
  string public MainLogicContractAbi;

  address public DataContractAddress;
  string public DataContractAbi;

  function Gateway() public {
    // constructor
  }

  function SetMainLoginContract(address newAddress, string newAbi) onlyOwner external {
    MainLogicContractAddress = newAddress;
    MainLogicContractAbi = newAbi;
  }

  function SetDataContract(address newAddress, string newAbi) onlyOwner external {
    DataContractAddress = newAddress;
    DataContractAbi = newAbi;
  }

}
