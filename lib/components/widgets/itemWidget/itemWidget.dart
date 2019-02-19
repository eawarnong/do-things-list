import 'package:flutter/material.dart';
import '../../../models/item.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  ItemWidget({ this.item });

  @override
  Widget build(BuildContext context) {
    return Text(item.toString());
  }

}