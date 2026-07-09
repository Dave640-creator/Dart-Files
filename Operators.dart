import 'dart:io';

void main() {
  int age = 20;

  String status;

  status = age >= 18 ? "Adult" : "Minor";

  print(status);

  int a = 10;
  int b = 10;

  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a ~/ b);
  print(a % b);

  int x = 10;
  x++;
  print(x);

  int y = 5;
  int z = ++y;

  print(y);
  print(z);
  int w = 10;
  print(w++);

  String name = "Dave";

  stdout.write("Hello, $name\n");
}
