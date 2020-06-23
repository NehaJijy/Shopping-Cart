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
        primarySwatch: Colors.pink,
        accentColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:130),
            Text(
              'Eric Brian Anil',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 33,
                color: const Color(0xff3a54e3),
                letterSpacing: 2.744,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height:10),
            Text(
              'Shopping Cart',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                color: const Color(0xff3a54e3),
                letterSpacing: 1.843,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height:10),
          ItemList(_userItems),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: const Color(0xffdd377b),
          onPressed: () => _startAddNewItem(context),
        ),
      ),
    );
  }
}