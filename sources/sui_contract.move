module 0x123::IBTToken {
    public struct Token has store, drop {
        owner: address,
        balance: u64,
    }
    public fun mint(tx_context: &mut TxContext, amount: u64): Token {
        let owner = tx_context::sender(tx_context); // Get the sender's address
        Token {
            owner,
            balance: amount,
        }
    }
    public fun burn(tx_context: &mut TxContext, token: Token): u64 {
        let owner = tx_context::sender(tx_context);
        assert!(
            token.owner == owner,
            1
        );
        let balance = token.balance;
        token;
    }
}
