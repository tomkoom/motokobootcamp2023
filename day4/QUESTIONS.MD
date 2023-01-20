Q1: Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?

A1: No heap memory is not saved when upgrading a canister. The Wasm module heap memory is limited to 4gb.

Q2: How much accounts can a unique Principal own?

A2: One Principal can have up to 4,294,967,295 (maximum value for a 32-bit unsigned integer) plus zero-subaccount (default account) accounts.

Q3: Can we safely upgrade a canister from interface A to interface B?
Interface A

A3:

```
actor {
  public func greet(surname : Text, firstname : Text) : async Text {
    return "Hello" # firstname # surname # " !";
  };
}
```

Interface B

```
actor {
  public func greet(firstname : Text) : async Text {
    return "Hello" # firstname # " !";
  };
}
```

A3: Removing a parameter of a public function will change the Candid interface. There is no information being saved to the memory of the canister so you won't loose information.
