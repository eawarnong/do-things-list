class Item {
  String id;
  String name;
  double price;
  String currency;
  int quantity;
  bool completed;

  Item({
    this.id,
    this.name,
    this.price,
    this.currency,
    this.quantity,
    this.completed
  });

  @override
  String toString() {
    return '\n(id=$id : name=$name)';
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price:json['price'],
      currency: json['currency'],
      quantity: json['quantity'],
      completed: json['completed']
    );
  }
}