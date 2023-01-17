import Array "mo:base/Array";

actor {
  // 1. Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
  // average_array(array : [Int]) -> async Int.

  public func average_array(arr : [Int]) : async Int {
    let sum = Array.foldLeft<Int, Int>(arr, 0, func(sumSoFar, x) = sumSoFar + x);
    let size = arr.size();
    sum / size;
  };

  // 2. Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
  // count_character(t : Text, c : Char) -> async Nat

  public func count_character(t : Text, c : Char) : async Nat {
    1;
  };

  // 3. Write a function factorial that takes a natural number n and returns the factorial of n.
  // factorial(n : Nat) ->  async Nat

  public func factorial(n : Nat) : async Nat {
    func calculate(m : Nat) : Nat {
      if (m == 0) {
        return 1;
      } else {
        return m * calculate(m - 1);
      };
    };

    return calculate(n);
  };
};
