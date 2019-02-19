import 'package:flutter/material.dart';
import '../../widgets/itemWidget/index.dart';
import '../../../models/item.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;
  ItemList({ Key key, this.items }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return new ItemWidget(item: items[index]);
      },
    );
  }
}