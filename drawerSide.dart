import 'package:application/Screens/ApiProduct.dart';
import 'package:application/Screens/darazScreen.dart';
import 'package:application/Screens/dynamicList.dart';
import 'package:application/Screens/firstScreen.dart';
// import 'package:application/Screens/product.dart';
import 'package:flutter/material.dart';
import 'package:application/Screens/billcalculator.dart';


class DrawerSide extends StatefulWidget {
  const DrawerSide({ Key? key }) : super(key: key);

  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => FirstScreen()));         },
          ),
          ListTile(
            leading: Icon(Icons.laptop),
            title: Text('Daraz Screen'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => DarazScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.laptop),
            title: Text('Laptops'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => DynamicList()));
            },
          ),
          ListTile(
            leading: Icon(Icons.laptop),
            title: Text('API Products'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => ApiProduct()));
            },
          ),
           ListTile(
            leading: Icon(Icons.settings),
            title: Text('Bill Calculator'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => BillCalculator()));
            },
          ),
        ],
      ),
    );
  }
}