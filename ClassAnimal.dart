void main() {
  Animal genericAnimal = Animal("Creature", 3);
  genericAnimal.makeSound();
  print(genericAnimal);

  Dog dog1 = Dog("TOKOy", 20, "Chiwawa");

  dog1.makeSound();
  dog1.eat();
}

class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  Animal.baby(String name) : this(name, 0);

  void makeSound() {
    print("$name make a sound");
  }

  void eat() {
    print("$name is eating");
  }

  @override
  String toString() => "$name ($age years old)";
}

class Dog extends Animal {
  String _breed;

  Dog(String name, int age, this._breed) : super(name, age);

  String get breed => _breed;
  set breed(String newBreed) {
    _breed = newBreed;
  }

  @override
  void makeSound() {
    print("$name the $_breed says: Woof!");
  }

  @override
  void eat() {
    print("$name the $_breed is eating");
  }
}
