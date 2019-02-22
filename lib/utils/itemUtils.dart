import '../models/item.dart';

class ItemUtils {
  static String getPrice(double price) {
    int whole = price.floor();
    double fraction = price - whole;
    return '${fraction == 0? whole: price}';
  }

  static String calculateTotalItemsPrice(List<Item> items) {
    double totalPrice = 0;
    double paidPrice = 0;
    items.forEach((item) {
      double sumPrice = calculateItemPrice(item);
      if(item.completed) paidPrice += sumPrice;
      totalPrice += sumPrice;
    });
    return 'Total ${getPrice(paidPrice)} / ${getPrice(totalPrice)}';
  }

  static double calculateItemPrice(Item item) {
    return item.price * item.quantity;
  }
}