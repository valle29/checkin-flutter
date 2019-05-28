import 'package:checkin/fragments/home.dart';
import 'package:checkin/fragments/messages.dart';
import 'package:checkin/fragments/perfil.dart';
import 'package:flutter/material.dart';

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title,this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Inicio", Icons.home),
    new DrawerItem("Mensajes", Icons.mail),
    new DrawerItem("Perfil", Icons.person)
  ];

  @override
  State<StatefulWidget> createState(){
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0:
        return new HomeFragment();
      case 1:
        return new MessagesFragment();
      case 2:
        return new ProfileFragment();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index){
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for(var i=0; i<widget.drawerItems.length; i++){
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: Text("Antonio Valle"),
                accountEmail: Text("vallegalvez.93@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                      ? Colors.green
                      : Colors.white,
                ),
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),

//      bottomNavigationBar: BottomNavigationBar(
//        onTap: onTabTapped,
//        currentIndex: _currentIndex,
//        items: [
//          BottomNavigationBarItem(
//              icon: new Icon(Icons.home),
//              title: new Text('Inicio')
//          ),
//          BottomNavigationBarItem(
//              icon: new Icon(Icons.mail),
//              title: new Text('Mensajes')
//          ),
//          BottomNavigationBarItem(
//              icon: new Icon(Icons.person),
//              title: new Text('Perfil')
//          )
//        ]
//      ),
    );
  }

//  void onTabTapped(int index) {
//    setState(() {
//      _currentIndex = index;
//    });
//  }

}