import 'package:flutter/material.dart';
import 'package:utility_list/widgets/new_item.dart';
import 'package:utility_list/widgets/ulist.dart';
import 'package:utility_list/models/item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Montserrat',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Item> _userItems = [
    
  ]; 
 

  void _addNewItem(String itTitle, String itQuantity){
    final newIt = Item(
      title: itTitle, 
      quantity: itQuantity, 
      id: DateTime.now().toString(),
      );

      setState(() {
        _userItems.add(newIt);

      });
  }

  void _startAddNewItem(BuildContext cit){
    showModalBottomSheet(context: cit, builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewItem(_addNewItem),
        behavior: HitTestBehavior.opaque,
        );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('smarTangle'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () => _startAddNewItem(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('SHOPPING CART',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                )
              ),
            ),
          ItemList(_userItems),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewItem(context),
      ),
    );
  }
}