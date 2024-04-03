import 'package:flutter/material.dart';
import 'package:project123/Cart.dart';
import 'package:project123/Contact.dart';
import 'package:project123/Discover.dart';
import 'package:project123/Home.dart';
import 'package:project123/message.dart';
import 'package:project123/navbar.dart';
import 'package:project123/order.dart';

class Dashboard extends StatefulWidget {
   Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0; // Index of the currently selected tab
  final List<Widget> _tabs = [
    Home(),
    Contact(),
    Cart(),
    Message(),
    Discover(),
    order(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightGreen,

        title: Text('EXOTIC FRUITS', style:TextStyle(color: Colors.black),),
         actions:[
         //   PopupMenuButton(
         //    onSelected: (item)=> handleCLick(item),
         // )

         ],


      ),
      body: _tabs[_currentIndex], // Display the current tab's screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'My Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'more',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: NavBar(),
    );
  }
}
