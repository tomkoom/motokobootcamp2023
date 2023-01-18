Q1: How much is the current memory capacity of a canister?

A1: Stable memory capacity is 48gb at the time of writing (Dec 2022 update).

···

Q2: What is the issue with the following code sample?

```
actor {
  let counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };
};
```

A2: You can't reassign the value of a counter as it has been decared as non-mutable. The corrected code:

```
actor {
  var counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };
};
```

···

Q3: What is the issue with the following code sample?

```
actor {
  var message : Text = 0;

  public query func change_message(new_message : Text) : async () {
    message := new_message;
    return;
  };

  public query func see_message() : async Text {
    return(message);
  };
};
```

A3:

- You can't assign a number value to the `message` variable as its type is `Text`.

- `change_message` func is intended to change the `message` variabe and is declared as `query`, which is wrong. You should remove the `query` keyword from the function declaration to work correctly.

···

Q4: False or True: we can remove the keyword async for the return argument of a query function since queries are faster to answer.

A4: False, as you still have to wait for the response.
