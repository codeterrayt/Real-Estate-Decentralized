// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RealEstate {
    address payable public propertyOwner;
    address payable public agent;
    address public buyer;
    uint256 public housePrice = 11 ether;
    uint256 public agentCommission = 2 ether;

    bool public houseSold = false;

    // Modifier to restrict access to the property owner
    modifier onlyPropertyOwner() {
        require(msg.sender == propertyOwner, "Only property owner can perform this action.");
        _;
    }

    // Modifier to ensure that the agent is not the buyer
    modifier notAgent() {
        require(msg.sender != agent, "Agent cannot purchase the property.");
        _;
    }

    // Constructor to set the property owner (the one who deploys the contract)
    constructor() {
        propertyOwner = payable(msg.sender);  // Owner is the deployer of the contract
    }

    // Function for the property owner to assign an agent
    function assignAgent(address payable _agent) external onlyPropertyOwner {
        agent = _agent;
    }

    // Function for the buyer to purchase the house
    function buyHouse() external payable notAgent {
        require(!houseSold, "House has already been sold.");
        require(msg.value == housePrice, "Please send exactly 10 ether to buy the house.");
        require(agent != address(0), "No agent assigned to this sale.");

        // 1 ether commission to the agent
        agent.transfer(agentCommission);

        // 9 ether to the property owner
        propertyOwner.transfer(housePrice - agentCommission);

        // Transfer ownership of the house to the buyer
        buyer = msg.sender;

        // Mark the house as sold
        houseSold = true;
    }

    // Function to check current ownership of the house
    function getOwner() external view returns (address) {
        return buyer == address(0) ? propertyOwner : buyer;
    }
}
