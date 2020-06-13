import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Neumorphic Bottom Navigation Bar',
      debugShowCheckedModeBanner: false,
      home: NeumorphicBottomNavigation(),
    );
  }
}

class NeumorphicBottomNavigation extends StatefulWidget {
  @override
  _NeumorphicBottomNavigationState createState() =>
      _NeumorphicBottomNavigationState();
}

class _NeumorphicBottomNavigationState
    extends State<NeumorphicBottomNavigation> {
  int selectedIndex = 0;

  List<Color> _bgColor = [
    Colors.red[600],
    Colors.blue[900],
    Colors.deepOrange[600],
    Colors.cyan[600],
    Colors.deepPurple[500],
  ];

  // List<Widget> _navigationScreens = [
  //   Container(
  //     height: double.infinity,
  //     width: double.infinity,
  //     child: Center(child: Text("Welcome"))
  //   ),
  //   Container(
  //     height: double.infinity,
  //     width: double.infinity,
  //     child: Center(child: Text("Welcome"))
  //   ),
  //   Container(
  //     height: double.infinity,
  //     width: double.infinity,
  //     child: Center(child: Text("Welcome"))
  //   ),
  //   Container(
  //     height: double.infinity,
  //     width: double.infinity,
  //     child: Center(child: Text("Welcome"))
  //   ),
  //   Container(
  //     height: double.infinity,
  //     width: double.infinity,
  //     child: Center(child: Text("Welcome"))
  //   ),
  // ];

  List<NavigationItem> items = [
    NavigationItem(
      icon: Icon(Icons.home),
      color: Colors.red[600],
    ),
    NavigationItem(
      icon: Icon(Icons.settings),
      color: Colors.blue[900],
    ),
    NavigationItem(
      icon: Icon(Icons.dashboard),
      color: Colors.deepOrange[600],
    ),
    NavigationItem(
      icon: Icon(Icons.notifications),
      color: Colors.cyan[600],
    ),
    NavigationItem(
      icon: Icon(Icons.person),
      color: Colors.deepPurple[500],
    ),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: isSelected
            ? []
            : [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5.0, -5.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: Colors.grey[500],
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ],
        gradient: isSelected
            ? LinearGradient(colors: [
                Colors.grey[500],
                Colors.grey[400],
                Colors.grey[300],
                Colors.grey[200],
                Colors.grey[100]
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : null,
      ),
      child: IconTheme(
        data: IconThemeData(
          size: 25.0,
          color: isSelected ? item.color : Colors.grey[800],
        ),
        child: item.icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor.elementAt(selectedIndex),
      // body: _navigationScreens.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 75.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            color: Colors.grey[300]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: _buildItem(item, selectedIndex == itemIndex),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Color color;

  NavigationItem({this.icon, this.color});
}
