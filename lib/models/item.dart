class Item {
  final String id;
  final String name;
  final double price;
  final int amount;
  final bool completed;

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
      completed: json['complete']
    );
  }
}