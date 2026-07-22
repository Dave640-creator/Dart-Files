// =========================================================================
// LIBRARY MANAGEMENT SYSTEM (Console App)
// =========================================================================
// This single file is a "big project" example that intentionally uses
// EVERY Dart class concept from the guide, in one working console program:
//
//   1. Basic classes, fields, constructors, methods
//   2. Named constructors / redirecting constructors
//   3. Inheritance (extends) + method overriding (polymorphism)
//   4. Abstract classes
//   5. Interfaces (implements)
//   6. Mixins (mixin / with)
//   7. Static members
//   8. Factory constructors (singleton pattern)
//   9. Const constructors (immutable objects)
//  10. Class modifiers - sealed (Dart 3+)
//  11. Operator overloading (==, hashCode)
//  12. Generic classes
//  13. Enhanced enums (fields + methods)
//  14. Extension methods
//  15. Cascade notation ( .. )
//  16. Initializer list with assert
//  17. late keyword
//  18. noSuchMethod
//  19. Extension types (Dart 3.3+)
//  20. Object class basics (toString, ==, hashCode, runtimeType)
//
// Every block below has a "NOTE:" comment explaining WHICH concept it
// demonstrates and WHY it's written that way. Run with:  dart run library_system.dart
// =========================================================================


// -------------------------------------------------------------------------
// NOTE (13. Enhanced Enum): Enums can carry fields, a const constructor,
// and methods -- not just a plain list of names.
// -------------------------------------------------------------------------
enum BookGenre {
  fiction('Fiction', 7),
  science('Science', 14),
  history('History', 14),
  fantasy('Fantasy', 7);

  final String label;
  final int loanPeriodDays; // how many days this genre can be borrowed for

  const BookGenre(this.label, this.loanPeriodDays);

  String describe() => '$label (loan period: $loanPeriodDays days)';
}


// -------------------------------------------------------------------------
// NOTE (19. Extension Type): A zero-cost wrapper around a plain String so
// that a raw ISBN string and a "real" BookId can't be mixed up by mistake,
// without the runtime cost of an actual wrapper object.
// -------------------------------------------------------------------------
extension type BookId(String isbn) {
  bool get isValidFormat => isbn.length == 13 && int.tryParse(isbn) != null;
}


// -------------------------------------------------------------------------
// NOTE (14. Extension Method): Adds a helper method to the built-in String
// class without modifying String itself or creating a subclass.
// -------------------------------------------------------------------------
extension StringCasingExtension on String {
  String capitalize() =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}


// -------------------------------------------------------------------------
// NOTE (9. Const Constructor + 16. Initializer List with assert):
// Book is immutable (all fields final) and its const constructor lets us
// create compile-time constant Book objects. The `assert` in the
// initializer list validates data before the object is ever created.
// NOTE (11. Operator Overloading): == and hashCode are overridden so two
// Book objects with the same title+author are treated as "equal", instead
// of Dart's default identity comparison.
// -------------------------------------------------------------------------
class Book {
  final String title;
  final String author;
  final BookGenre genre;
  final int year;

  const Book(this.title, this.author, this.genre, this.year)
      : assert(year > 0, 'Publication year must be positive');

  // NOTE (2. Named / Redirecting Constructor): reuses the main constructor
  // instead of repeating field-assignment logic.
  Book.classic(String title, String author)
      : this(title, author, BookGenre.fiction, 1900);

  @override
  bool operator ==(Object other) =>
      other is Book && other.title == title && other.author == author;

  @override
  int get hashCode => Object.hash(title, author);

  // NOTE (20. Object Class Basics): overriding toString() changes what
  // print(book) shows, instead of the default "Instance of 'Book'".
  @override
  String toString() => '"$title" by $author (${genre.label}, $year)';
}


// -------------------------------------------------------------------------
// NOTE (4. Abstract Class): Person cannot be instantiated on its own -- it
// only exists to be extended, and forces subclasses to implement describe().
// -------------------------------------------------------------------------
abstract class Person {
  final String name;
  final String id;

  Person(this.name, this.id);

  String describe(); // no body -> every subclass MUST implement this
}


// -------------------------------------------------------------------------
// NOTE (5. Interface via implements): Any class can act as an interface.
// Payable has no logic of its own here -- it just defines a contract that
// implementing classes must fully satisfy.
// -------------------------------------------------------------------------
class Payable {
  void payLateFee(double amount) {
    print('Generic payment of \$$amount');
  }
}


// -------------------------------------------------------------------------
// NOTE (6. Mixin): Borrower is behavior that both Member and (potentially)
// other unrelated classes can reuse via `with`, without a shared parent
// class. It works on "any class that has a `name` field" via `on Person`.
// -------------------------------------------------------------------------
mixin Borrower on Person {
  final List<Book> _borrowedBooks = [];

  List<Book> get borrowedBooks => List.unmodifiable(_borrowedBooks);

  BorrowResult borrow(Book book) {
    if (_borrowedBooks.length >= 3) {
      return BorrowFailure('$name already has the maximum of 3 books.');
    }
    _borrowedBooks.add(book);
    return BorrowSuccess(book);
  }

  void returnBook(Book book) {
    _borrowedBooks.remove(book);
    print('$name returned $book');
  }
}


// -------------------------------------------------------------------------
// NOTE (10. Class Modifier - sealed): BorrowResult's subtypes MUST live in
// this same file. That lets the `switch` in main() be exhaustive -- the
// Dart compiler knows there are no other possible subtypes to handle.
// -------------------------------------------------------------------------
sealed class BorrowResult {}

class BorrowSuccess extends BorrowResult {
  final Book book;
  BorrowSuccess(this.book);
}

class BorrowFailure extends BorrowResult {
  final String reason;
  BorrowFailure(this.reason);
}


// -------------------------------------------------------------------------
// NOTE (3. Inheritance + implements + mixin combined):
// Member extends Person (inheritance), implements Payable (interface
// contract), and uses Borrower (mixin) -- showing all three composition
// tools working together on one class.
// NOTE (17. late keyword): membershipCard is not known until
// activateCard() runs, but is guaranteed to exist before it's read.
// -------------------------------------------------------------------------
class Member extends Person with Borrower implements Payable {
  late String membershipCard;
  double lateFeeOwed = 0;

  Member(super.name, super.id);

  void activateCard() {
    membershipCard = 'CARD-${id.padLeft(5, '0')}';
  }

  // NOTE (3. Polymorphism / @override): gives Member its own version of
  // the contract defined by the abstract Person class.
  @override
  String describe() => 'Member: ${name.capitalize()} (id: $id)';

  // NOTE (5. Interface fulfilment): Member must provide its own
  // payLateFee because it `implements Payable` (implements does not
  // inherit Payable's default body).
  @override
  void payLateFee(double amount) {
    lateFeeOwed = (lateFeeOwed - amount).clamp(0, lateFeeOwed);
    print('${name.capitalize()} paid \$$amount towards late fees.');
  }
}


class Librarian extends Person {
  Librarian(super.name, super.id);

  @override
  String describe() => 'Librarian: ${name.capitalize()} (id: $id)';

  void issueBook(Member member, Book book) {
    final result = member.borrow(book);
    // NOTE (10. sealed + switch pattern matching): the switch below is
    // exhaustive because BorrowResult is sealed -- no `default` needed,
    // and the compiler would warn if a new subtype were added and not
    // handled here.
    switch (result) {
      case BorrowSuccess(book: final b):
        print('${name.capitalize()} issued $b to ${member.name.capitalize()}.');
        break;
      case BorrowFailure(reason: final r):
        print('Could not issue book: $r');
        break;
    }
  }
}


// -------------------------------------------------------------------------
// NOTE (12. Generic Class): Repository<T> works for ANY type -- we reuse
// the exact same class for storing Books and storing Members below,
// instead of writing BookRepository and MemberRepository separately.
// -------------------------------------------------------------------------
class Repository<T> {
  final List<T> _items = [];

  void add(T item) => _items.add(item);

  List<T> all() => List.unmodifiable(_items);

  List<T> where(bool Function(T item) test) => _items.where(test).toList();

  // NOTE (7. Static Member): totalRepositories belongs to the Repository
  // CLASS itself, shared across every Repository<T> instance ever created,
  // regardless of what T is.
  static int totalRepositories = 0;

  Repository() {
    Repository.totalRepositories++;
  }
}


// -------------------------------------------------------------------------
// NOTE (8. Factory Constructor / Singleton): calling Library() never
// actually builds a second object once one exists -- it returns the same
// cached instance every time, which is the classic singleton pattern.
// -------------------------------------------------------------------------
class Library {
  static Library? _instance;

  final Repository<Book> books = Repository<Book>();
  final Repository<Member> members = Repository<Member>();

  Library._internal(this.name);

  final String name;

  factory Library(String name) {
    return _instance ??= Library._internal(name);
  }
}


// -------------------------------------------------------------------------
// NOTE (18. noSuchMethod): overriding this lets an object respond to
// method calls that don't actually exist on it -- used here to build a
// tiny logging proxy that prints every call made through it.
// -------------------------------------------------------------------------
class CallLogger {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    final member = invocation.memberName.toString().replaceAll('Symbol("', '').replaceAll('")', '');
    print('[LOG] Unrecognized call intercepted -> $member');
    return null;
  }
}


// =========================================================================
// MAIN -- runs the whole scenario end-to-end
// =========================================================================
void main() {
  print('=== LIBRARY MANAGEMENT SYSTEM ===\n');

  // NOTE (8. Factory/Singleton): both calls return the SAME instance.
  final library = Library('City Central Library');
  final library2 = Library('Ignored Name'); // factory returns the cached one
  print('Same library instance? ${identical(library, library2)}\n');

  // NOTE (9. Const Constructor): these Book objects are compile-time
  // constants -- identical const values are automatically reused in memory.
  const book1 = Book('Clean Code', 'Robert C. Martin', BookGenre.science, 2008);
  const book2 = Book('Dune', 'Frank Herbert', BookGenre.fantasy, 1965);
  final book3 = Book.classic('Moby Dick', 'Herman Melville'); // redirecting ctor

  // NOTE (15. Cascade Notation): add() is called three times on the same
  // `library.books` object without retyping it each time.
  library.books
    ..add(book1)
    ..add(book2)
    ..add(book3);

  print('Books in catalog:');
  for (final b in library.books.all()) {
    print('  - $b');
  }
  print('');

  // NOTE (13. Enhanced Enum): calling a method defined ON the enum value.
  print('Genre info: ${BookGenre.fantasy.describe()}\n');

  // NOTE (19. Extension Type): a BookId behaves like a String but carries
  // its own extra API (isValidFormat).
  final id = BookId('9780132350884');
  print('ISBN $id valid format? ${id.isValidFormat}\n');

  // Create people.
  final member = Member('juan dela cruz', '101')..activateCard();
  final librarian = Librarian('maria santos', '900');

  print(member.describe());
  print(librarian.describe());
  print('Member card: ${member.membershipCard}\n');

  // NOTE (11. Operator Overloading): comparing two different Book objects
  // that share the same title/author is true because of our custom ==.
  final duplicateBook3 = Book.classic('Moby Dick', 'Herman Melville');
  print('book3 == duplicateBook3 ? ${book3 == duplicateBook3} (custom == override)\n');

  // Borrowing flow (mixin + sealed result type).
  librarian.issueBook(member, book1);
  librarian.issueBook(member, book2);
  librarian.issueBook(member, book3);
  librarian.issueBook(member, const Book('Extra Book', 'Someone', BookGenre.history, 2020));
  print('');

  member.lateFeeOwed = 12.5;
  member.payLateFee(5.0);
  print('Remaining late fee: \$${member.lateFeeOwed}\n');

  // NOTE (12. Generics): the SAME Repository<T> class stores Members too.
  library.members.add(member);
  print('Registered members: ${library.members.all().map((m) => m.name).toList()}');
  print('Total Repository<T> instances created: ${Repository.totalRepositories}\n');

  // NOTE (14. Extension Method): capitalize() now works on any String.
  print('Extension method demo: ${'dart is fun'.capitalize()}\n');

  // NOTE (20. Object Class Basics): every object automatically has these,
  // even though Book never wrote "extends Object" explicitly.
  print('book1.toString() -> $book1');
  print('book1.runtimeType -> ${book1.runtimeType}');
  print('book1.hashCode    -> ${book1.hashCode}\n');

  // NOTE (18. noSuchMethod): calling a method that does not exist on
  // CallLogger at all -- it's intercepted instead of throwing an error.
  dynamic logger = CallLogger();
  logger.trackEvent('user_login');
  logger.anythingGoesHere(42);
}
