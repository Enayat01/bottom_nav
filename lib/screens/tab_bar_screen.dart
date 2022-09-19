import 'package:bottom_nav/widgets/map_screen.dart';
import 'package:bottom_nav/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

import 'cars_screen.dart';
import 'history_screen.dart';
import 'location_screen.dart';

import '../screens/home_screen.dart';
import '../widgets/fab.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedPageIndex = 4; //initial selected page
  late List<Map<String, Object>> _pages; //List of pages
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index; //updating selected page
    });
  }

  @override
  void initState() {
    //List of pages as map
    _pages = [
      {'page':  const HistoryScreen(), 'title': 'History'},
      {'page': const CarsScreen(), 'title': 'My Cars'},
      {'page': '', 'title': ''},
      {'page': const MapScreen(), 'title': 'Locations'},
      {'page': const HomeScreen(), 'title': 'Home Page'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const SideDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const Fab(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // show cutout in app bar
        color: const Color.fromRGBO(230, 230, 230, 1),
        elevation: 0,
        notchMargin: 8, //amount of gap between appBar and FAB
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          //using SizedBox for giving height to navBar
          height: 80,
          child: BottomNavigationBar(
            onTap: _selectPage,
            elevation: 0,
            backgroundColor:
                const Color.fromRGBO(230, 230, 230, 1).withAlpha(0),
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Theme.of(context).primaryColor,
            showUnselectedLabels: true,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.car_crash_rounded),
                label: 'My Cars',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 10,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.share_location_rounded),
                label: 'Locations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              )
            ],
          ),
        ),
      ),
    );
  }
}
