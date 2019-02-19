import 'package:flutter/material.dart';
import '../../../models/item.dart';

class ItemWidget extends StatefulWidget {
  final Item item;
  ItemWidget({ Key key, this.item }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState(item);
}

class _ItemWidgetState extends State<ItemWidget> {
  Item _item;
  _ItemWidgetState(this._item);

  void _onCompletedChanged(bool completed) {
    setState(() {
      _item.completed = completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _item.completed,
      onChanged: _onCompletedChanged,
      title: new Text(_item.name),
      subtitle: new Text('price: ${_item.price} amount: ${_item.amount}'),
    );
  }
}