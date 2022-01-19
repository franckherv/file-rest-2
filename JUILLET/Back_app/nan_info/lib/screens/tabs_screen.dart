// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/nan_info_plus.dart';
import '../screens/settings_screen.dart';
import '../screens/video_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndexForBottomNavigationBar = 0;
  int _selectedIndexForTabBar = 0;

  // ignore: prefer_final_fields
  static List<Widget> _listOfIconsForBottomNavigationBar = <Widget>[
    SettingsScreen(),
    NanInfoPlus()
  ];

  //2
  // ignore: prefer_final_fields
  static List<Widget> _listOfIconsForTabBar = <Widget>[
    GuilleApp(),
    VideoScreen()
  ];

  //3
  void _onItemTappedForBottomNavigationBar(int index) {
    setState(() {
        _selectedIndexForBottomNavigationBar = index;
      _selectedIndexForTabBar = 0;
    });
  }

  //4
  void _onItemTappedForTabBar(int index) {
    setState(() {
            _selectedIndexForTabBar = index+1;
      _selectedIndexForBottomNavigationBar = 0;
    });
  }

  // final List<Widget> pages = [SettingsScreen(), NanInfoPlus()];
  // int tabsIndex = 0;
  // void _selectedPage(int index) {
  //   setState(() {
  //     tabsIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //5
    final tabBar = TabBar(
      labelColor: Colors.white,
      onTap: _onItemTappedForTabBar,
      // ignore: prefer_const_literals_to_create_immutables
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.category),
          child: Text("Catégories", style: TextStyle(fontSize: 20)),
        ),
        Tab(
          icon: Icon(Icons.video_call),
          child: Text("Vidéo", style: TextStyle(fontSize: 20)),
        ),
      ],
    );

    //6
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: tabBar,
          backgroundColor: Colors.deepPurple,
          //title: Text('Tabs Demo')
        ),

        //7
        body: Center(child:_selectedIndexForTabBar == 0 ?
      _listOfIconsForBottomNavigationBar.elementAt(_selectedIndexForBottomNavigationBar):
      _listOfIconsForTabBar.elementAt(_selectedIndexForTabBar - 1)),

        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            onTap: _onItemTappedForBottomNavigationBar,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.amber,
            currentIndex: _selectedIndexForBottomNavigationBar,
            type: BottomNavigationBarType.shifting,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.settings),
                  label: "Paramètre"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.new_label),
                  label: "Info"),
            ]),
      ),
    );
  }

  // @override
  //currentIndex: _selectedIndexForBottomNavigationBar,
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(

  //       appBar: AppBar(
  //         bottom: const TabBar(
  //           tabs: [
  //             Tab(
  //               icon: Icon(Icons.category),
  //               child: Text("Catégories", style: TextStyle(fontSize: 20)),
  //             ),
  //             Tab(
  //               icon: Icon(Icons.video_call),
  //               child: Text("Vidéo", style: TextStyle(fontSize: 20)),
  //             ),
  //           ],
  //         ),
  //       ),
  //       body: TabBarView(
  //         children: [GuilleApp(), VideoScreen()],
  //       ),
  //       bottomNavigationBar: BottomNavigationBar(
  //           backgroundColor: Theme.of(context).primaryColor,
  //           onTap: _selectedPage,
  //           unselectedItemColor: Colors.white,
  //           selectedItemColor: Colors.amber,
  //           currentIndex: tabsIndex,
  //           type: BottomNavigationBarType.shifting,
  //           // ignore: prefer_const_literals_to_create_immutables
  //           items: [
  //             BottomNavigationBarItem(
  //                 backgroundColor: Theme.of(context).primaryColor,
  //                 icon: Icon(Icons.settings),
  //                 label: "Paramètre"),
  //             BottomNavigationBarItem(
  //                 backgroundColor: Theme.of(context).primaryColor,
  //                 icon: Icon(Icons.new_label),
  //                 label: "Info"),
  //           ]),
  //     ),
  //   );
  // }
}
