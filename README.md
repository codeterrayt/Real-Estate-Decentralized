### Project Title: **Decentralized Real Estate Transaction System with Agent Commission**

---

### Overview:

This project involves building a decentralized real estate transaction system using the Ethereum blockchain. The system allows a property owner to list a house for sale at a set price (10 Ether). It introduces three main participants:
- **Property Owner**: The individual who owns the house and lists it for sale.
- **Agent**: A third party who acts as a middleman in the transaction and receives a commission of 1 Ether.
- **Buyer**: The individual who purchases the house from the property owner, facilitated by the agent.

The transaction ensures that the agent automatically receives their commission, while the remaining balance is transferred to the property owner. The smart contract guarantees transparency, security, and immutability throughout the transaction process. The house is transferred to the buyer only after the successful completion of the payment.

---

### Features:

1. **Decentralization**: All operations, including payments and property transfers, are carried out on the Ethereum blockchain, ensuring transparency and eliminating the need for intermediaries (except the agent).
   
2. **Agent Commission**: The agent is automatically paid a commission of 1 Ether during the transaction.
   
3. **Role-Based Access Control**: The system enforces access control where the agent cannot purchase the property directly and only the property owner can assign an agent.

4. **Secure Payment Handling**: The buyer must pay exactly 10 Ether to proceed with the purchase, ensuring consistency and correct transaction handling.

5. **Ownership Transfer**: After the transaction, ownership of the house is transferred to the buyer, and the property owner relinquishes control.

---

### Project Structure:

The contract has been developed using Solidity and runs on the Ethereum blockchain. The contract handles three primary roles, and functions are tailored to specific participants in the transaction process.

#### Key Participants:
1. **Property Owner**: The contract deployer is the initial property owner.
2. **Agent**: The agent is assigned by the property owner to facilitate the transaction.
3. **Buyer**: The individual who sends Ether to purchase the house.

---

### Contract Design:

#### Variables:

- **propertyOwner**: Stores the address of the individual who owns the property. This address is set when the contract is deployed.
- **agent**: Stores the address of the agent assigned by the property owner.
- **buyer**: Stores the address of the buyer after the house is purchased.
- **housePrice**: The total price for the house (10 Ether).
- **agentCommission**: The fixed commission for the agent (1 Ether).
- **houseSold**: A boolean flag that ensures the house can only be sold once.

#### Modifiers:

- **onlyPropertyOwner**: Ensures that only the property owner can perform certain actions (like assigning an agent).
- **notAgent**: Prevents the agent from purchasing the property directly.

#### Functions:

1. **constructor()**: 
   - Initializes the contract and sets the property owner as the deployer of the contract.

2. **assignAgent(address payable _agent)**:
   - Allows the property owner to assign an agent to facilitate the sale.
   - Can only be called by the property owner (enforced by the `onlyPropertyOwner` modifier).

3. **buyHouse()**:
   - Allows a buyer to purchase the house by sending exactly 10 Ether.
   - The agent is automatically paid a commission of 1 Ether, and the remaining 9 Ether is transferred to the property owner.
   - The house ownership is transferred to the buyer after the transaction.
   - This function checks that the buyer is not the agent and ensures the house has not already been sold.

4. **getOwner()**:
   - Allows anyone to check the current owner of the property. Before the sale, the owner is the property owner; after the sale, the owner is the buyer.

---

### Step-by-Step Walkthrough:

1. **Deploy the Contract**: 
   - The contract is deployed by the `propertyOwner`. This account will be designated as the initial owner of the property.
   
2. **Assign an Agent**:
   - The property owner uses the `assignAgent()` function to assign an agent by providing the agent's address.
   
3. **Buy the Property**:
   - The `buyHouse()` function allows a buyer to purchase the house by sending exactly 10 Ether. The function ensures the buyer is not the agent and that the house is still available.
   
4. **Commission and Ownership Transfer**:
   - Upon receiving the payment, 1 Ether is automatically transferred to the agent, and the remaining 9 Ether is sent to the property owner. The house ownership is then transferred to the buyer.
   
5. **Ownership Check**:
   - The `getOwner()` function allows anyone to verify the current owner of the house.

---

### Deployment and Testing:

This smart contract can be deployed and tested using the **Remix IDE**, a powerful tool for Ethereum smart contract development.

#### Steps in Remix:

1. **Deploy the Contract**:
   - Deploy the contract using any Ethereum account in Remix. This account will become the `propertyOwner`.

2. **Assign an Agent**:
   - The `propertyOwner` uses the `assignAgent()` function and passes the agent’s address as a parameter.

3. **Buy the Property**:
   - Another account (not the agent) can then buy the house by calling the `buyHouse()` function with exactly 10 Ether.

4. **Check Ownership**:
   - After the transaction, the buyer can verify ownership by calling the `getOwner()` function.

---

### Use Cases:

1. **Decentralized Property Transactions**: 
   - Property buyers and sellers can interact securely without relying on third-party entities.
   
2. **Automated Agent Commission**: 
   - Real estate agents are automatically paid their commission, preventing disputes about payments.

3. **Immutable Records**: 
   - The blockchain ensures that all transaction records are immutable, providing transparency in property ownership transfer.

---

### Future Enhancements:

- **Escrow Mechanism**: Add a feature where the buyer's funds are locked in escrow until the property is verified.
- **Multiple Properties**: Extend the contract to allow the property owner to list multiple properties with different prices.
- **Dispute Resolution**: Add functionality to handle disputes between buyers, sellers, and agents.

---

### Conclusion:

This project showcases how blockchain technology can revolutionize real estate transactions by making them transparent, secure, and efficient. By integrating smart contracts, the need for intermediaries is minimized, and agent commissions are handled automatically. This contract sets the foundation for decentralized real estate systems and can be expanded with additional features such as escrow, property listings, and dispute management.
