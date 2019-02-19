class Item {
  String id;
  String name;
  double price;
  int amount;
  bool completed;

  Item({
    this.id,
    this.name,
    this.price,
    this.amount,
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
      amount: json['amount'],
      completed: json['completed']
    );
  }
}