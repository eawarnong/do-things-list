import 'package:flutter/material.dart';
import '../textWidget/titleText/index.dart';
import '../textWidget/amountCurrencyText/index.dart';
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

  Widget _amountCurrencyText(double price) {
    return AmountCurrencyText(price, _item.currency);
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _item.completed,
      onChanged: _onCompletedChanged,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(_item.name, true),
              _amountCurrencyText(_item.price)
            ]
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText('${_item.quantity} Qty', false),
              _amountCurrencyText(_item.price*_item.quantity)
            ]
          )
        ],
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}