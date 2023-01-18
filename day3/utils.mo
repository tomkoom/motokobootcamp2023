import Array "mo:base/Array";
import Int "mo:base/Int";

actor {
  // 1. In your file called utils.mo: create a function called second_maximum that takes an array [Int] of integers and returns the second largest number in the array.
  // second_maximum(array : [Int]) ->  Int;

  public func second_maximum(array : [Int]) : async Int {
    if (array.size() > 2) {
      let sorted = Array.sort(array, Int.compare);
      let i : Nat = sorted.size() - 2;
      let secondLargest = sorted[i];
      secondLargest;
    } else {
      0;
    };
  };

  // 2. In your file called utils.mo: create a function called remove_even that takes an array [Nat] and returns a new array with only the odd numbers from the original array.
  // remove_even(array : [Nat]) -> [Nat];

  public func remove_even(array : [Nat]) : async [Nat] {
    var notEven : [Nat] = [];
    for (v in array.vals()) {
      if (v % 2 != 0) {
        notEven := Array.append<Nat>(notEven, [v]);
      };
    };
    notEven;
  };

  // In your file called utils.mo: write a function drop that takes 2 parameters: an array [T] and a Nat n. This function will drop the n first elements of the array and returns the remainder.
  // ⛔️ Do not use a loop.
  // drop<T> : (xs : [T], n : Nat) -> [T]

};
