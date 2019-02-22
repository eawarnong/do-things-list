import 'package:flutter/material.dart';
import '../../widgets/itemWidget/index.dart';
import '../../../models/item.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;
  ItemList({ this.items });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return new ItemWidget(item: items[index]);
      },
      separatorBuilder: (context, index) {
        return Divider();
      }
    );
  }
}