Q1: Who controls the ledger canister?
A1: Ledger canister id is: [`ryjl3-tyaaa-aaaaa-aaaba-cai`](https://dashboard.internetcomputer.org/canister/ryjl3-tyaaa-aaaaa-aaaba-cai). The controller of the ledger canister is `r7inp-6aaaa-aaaaa-aaabq-cai`.

···

Q2: What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?
A2: The subnet of the canister with the id `mwrha-maaaa-aaaab-qabqq-cai` is `pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe`. There are `16` node machines running on this subnet: https://dashboard.internetcomputer.org/subnet/pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe.

···

Q3: I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
A3: 10 x 1.5 x ?

···

Q4: What is wrong with the following code?

```
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
}
```

A4: You have to import Nat module from Motoko Base Library to use `toText()` method. The corrected code:

```
import Nat "mo:base/Nat";

actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
};
```

···

Q5: What is wrong with the following code?

```
actor {
  var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [var Text] {
    return (languages);
  };
};
```

A5: Variable `languages` is a mutable array and mutable arrays are of a non-shared type. You can't return variables of non-shared types.

> This rule is designed to simplify your programming experience. It prevents multiple actors from simultaneously modifying a shared variable without knowledge of the other actors' actions. Otherwise this would cause confusion and make programming with actors way more difficult.

Also there is a syntax error, keyword `var` is lacking before enumerating languages within an array. The corrected code:

```
import Array "mo:base/Array";

actor {
  var languages : [var Text] = [var "English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [Text] {
    return (Array.freeze(languages));
  };
};
```

···

Q6: What is wrong with the following code?

```
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
    languages := Array.append<Text>(languages, [new_language]);
    return (languages);
  };
};
```

A6: You have to import Array module from Motoko Base Library to user `append` method. Corrected code:

```
import Array "mo:base/Array";

actor {
  var languages : [Text] = [
    "English",
    "German",
    "Chinese",
    "Japanese",
    "French",
  ];

  public func add_language(new_language : Text) : async [Text] {
    languages := Array.append<Text>(languages, [new_language]);
    return (languages);
  };
};
```
