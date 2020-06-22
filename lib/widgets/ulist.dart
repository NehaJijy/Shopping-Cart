import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:utility_list/models/item.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;
  
  ItemList(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (uit, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: Container(
              height: 60, 
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.all(6),
                  child: FittedBox(
                  child: Text(items[index].quantity)
                ),
              ),
              ),
              title: Text(
                items[index].title, 
                style: Theme.of(context).textTheme.headline6
                ),
            subtitle: Text('Details'),
            ),
          );
        },
        itemCount: items.length,
      )
    );
  }
}