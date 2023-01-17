import Array "mo:base/Array";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";

// motoko playground url:
// https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/?tag=1680889562

actor {
  // 1. Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
  // average_array(array : [Int]) -> async Int.

  public func average_array(arr : [Int]) : async Int {
    let sum = Array.foldLeft<Int, Int>(arr, 0, func(sumSoFar, x) = sumSoFar + x);
    let size = arr.size();
    return sum / size;
  };

  // 2. Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
  // count_character(t : Text, c : Char) -> async Nat

  public func count_character(t : Text, c : Char) : async Nat {
    var counter : Nat = 0;
    for (char in Text.toIter(t)) {
      if (char == c) {
        counter += 1;
      };
    };
    return counter;
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

  // 4. Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
  // number_of_words(t : Text) -> async Nat

  public func number_of_words(t : Text) : async Nat {
    let words = Text.split(t, #char ' ');
    return Iter.size(words);
  };

  // 5. Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
  // find_duplicates(a : [Nat]) -> async [Nat]

  public func find_duplicates(a : [Nat]) : async [Nat] {
    var duplicates : [Nat] = [];
    var arr : [Nat] = [];
    for (v in a.vals()) {
      switch (Array.find<Nat>(arr, func x = x == v)) {
        case (null) {
          arr := Array.append(arr, [v]);
        };
        case (?val) {
          switch (Array.find<Nat>(duplicates, func x = x == v)) {
            case (null) {
              duplicates := Array.append(duplicates, [v]);
            };
            case (?val) {};
          };
        };
      };
    };
    return duplicates;
  };

  // 6. Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
  // convert_to_binary(n : Nat) -> async Text

  public func convert_to_binary(n : Nat) : async Text {
    var binary : Text = "";
    var num : Nat = n;

    while (num != 0) {
      binary := Text.concat(Nat.toText(num % 2), binary);
      num /= 2;
    };
    return binary;
  };
};
