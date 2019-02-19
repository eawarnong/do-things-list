import 'package:flutter/material.dart';
import 'dart:convert';
import '../../layouts/itemList/index.dart';
import '../../../models/item.dart';

class Dashboard extends StatelessWidget {

  final mock = [
    {
      "id": "1",
      "name": "name1",
      "price": 5.0,
      "amount": 1,
      "completed": false
    },
    {
      "id": "2",
      "name": "name2",
      "price": 10.0,
      "amount": 2,
      "completed": false
    }
  ];

  Future<List<Item>> getItems() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Dashboard')
      ),
      body: FutureBuilder<List<Item>>(
        future: getItems(),
        builder: (context, result) {
          if(result.hasError) print(result.error);
          return result.hasData
          ? ItemList(items: result.data)
          : Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}