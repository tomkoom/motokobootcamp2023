// motoko playground url: https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/?tag=1764655153

import List "mo:base/List";
import Book "./book";

actor {
  var book : Book.Book = { title = ""; pages = 0 };

  // 6. In main.mo import the type List from the Base Library and create a list that stores books.
  var books = List.nil<Book.Book>();

  // 7. In main.mo create a function called add_book that takes a book as parameter and returns nothing this function should add this book to your list. Then create a second function called get_books that takes no parameter but returns an Array that contains all books stored in the list.

  public func add_book(book : Book.Book) : async () {
    books := List.push(book, books);
  };

  public query func get_books() : async [Book.Book] {
    List.toArray(books);
  };
};
