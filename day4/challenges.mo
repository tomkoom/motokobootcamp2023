// motoko playground url: https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/?tag=296713688
import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Principal "mo:base/Principal";
import Option "mo:base/Option";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

actor {
  // 1. Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.
  // unique<T> : (l : List<T>, equal: (T,T) -> Bool) -> List<T>

  // 2. Write a function reverse that takes l of type List and returns the reversed list.
  // reverse<T> : (l : List<T>) -> List<T>;

  func reverse<T>(l : List.List<T>) : List.List<T> {
    List.reverse<T>(l);
  };

  // 3. Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
  // is_anynomous : () -> async Bool;

  public shared ({ caller }) func is_anonymous() : async Bool {
    Principal.isAnonymous(caller);
  };

  // 4. Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the optional index of the first occurrence of "val" in "buf".
  // find_in_buffer<T> :  (buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) -> ?Nat

  func find_in_buffer<T>(
    buf : Buffer.Buffer<T>,
    val : T,
    equal : (T, T) -> Bool,
  ) : async ?Nat {
    Buffer.indexOf<T>(val, buf, equal);
  };

  // 5. Take a look at the code we've seen before in this guide:
  // import HashMap "mo:base/HashMap";
  // import Iter "mo:base/Iter";
  // import Principal "mo:base/Principal";
  // actor {
  //     let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);
  //     public shared ({ caller }) func add_username(name : Text) : async () {
  //       usernames.put(caller, name);
  //     };
  // };
  // Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.
  // get_usernames : () -> async [(Principal, Text)];

  let usernames = HashMap.HashMap<Principal, Text>(
    0,
    Principal.equal,
    Principal.hash,
  );

  public shared ({ caller }) func add_username(name : Text) : async () {
    usernames.put(caller, name);
  };

  public query func get_usernames() : async [(Principal, Text)] {
    return (Iter.toArray(usernames.entries()));
  };
};
