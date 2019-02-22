import 'package:flutter/material.dart';
import 'dart:convert';
import '../../layouts/itemList/index.dart';
import '../../../utils/itemUtils.dart';
import '../../../models/item.dart';

final mock = [
    {
      "id": "1",
      "name": "name1",
      "price": 5.0,
      "currency": "THB",
      "quantity": 1,
      "completed": false
    },
    {
      "id": "2",
      "name": "name2",
      "price": 10.0,
      "currency": "THB",
      "quantity": 2,
      "completed": false
    },
    {
      "id": "3",
      "name": "อันที่3",
      "price": 10.0,
      "currency": "THB",
      "quantity": 4,
      "completed": true
    }
  ];

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Item> _items;
  _DashboardState();

  Future<void> _setItems(List<Item> items) async {
    setState(() {
    _items = items;
    });
  }

  Future<List<Item>> _getItemsFromJson() async {
    List<Item> items = new List();
    List<dynamic> itemsJson = json.decode(json.encode(mock));
    for(var item in itemsJson) {
      items.add(Item.fromJson(item));
    }
    return items;
  }

  void _addItem() {
    print('add item');
  }

  // TODO: implement realtime updating paidPrice
  String _getTotalPrice() {
    return _items != null && _items.isNotEmpty
      ? ItemUtils.calculateTotalItemsPrice(_items)
      : '';
  }

  Widget _buildItemList(AsyncSnapshot<List<Item>> result) {
    if(result.hasError) print(result.error);
    if(result.hasData) {
      _setItems(result.data);
      return ItemList(items: _items);
    }
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard')
      ),
      body: FutureBuilder<List<Item>>(
        future: _getItemsFromJson(),
        builder: (context, result) => _buildItemList(result),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue[300],
        child: Container(
          height: 50.0,
          child: Text(_getTotalPrice()),
        )
      ),
    );
  }
}