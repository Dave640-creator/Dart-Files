void main() {
  createProduct("Laptop", 25000);
}

void createProduct(
  String name,
  double price, {
  String? description,
  int? stock = 0,
  String? category,
}) {
  print("Name :$name");
  print("Price :$price");
  print("Description :${description ?? "Not Provided"}");
  print("Stock: $stock");
  print("Category :${category ?? "Not Provided"}");
}
