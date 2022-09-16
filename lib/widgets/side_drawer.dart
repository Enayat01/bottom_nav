import 'package:bottom_nav/screens/cars_screen.dart';
import 'package:bottom_nav/screens/history_screen.dart';
import 'package:bottom_nav/screens/home_screen.dart';
import 'package:bottom_nav/screens/location_screen.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);
  final Color colorPrimary = const Color.fromRGBO(29, 25, 52, 1);

  //Custom ListTile widget for common usage
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: colorPrimary,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text(
              'Drawer Header',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          buildListTile(
            'Home Page',
            Icons.home_outlined,
            () {
              Navigator.of(context).pushReplacementNamed(
                HomeScreen.routeName,
              );
            },
          ),
          buildListTile(
            'Locations',
            Icons.share_location_rounded,
            () {
              Navigator.of(context).pushReplacementNamed(
                LocationScreen.routeName,
              );
            },
          ),
          buildListTile(
            'My Cars',
            Icons.car_crash_rounded,
            () {
              Navigator.of(context).pushReplacementNamed(
                CarsScreen.routeName,
              );
            },
          ),
          buildListTile(
            'History',
            Icons.calendar_today_rounded,
            () {
              Navigator.of(context).pushReplacementNamed(
                HistoryScreen.routeName,
              );
            },
          ),
          AboutListTile(
            icon: Icon(
              Icons.info_outline_rounded,
              size: 26,
              color: colorPrimary,
            ),
            applicationIcon: const Icon(
              Icons.local_play,
            ),
            applicationName: 'Flutter Demo',
            applicationVersion: '1.0',
            applicationLegalese: '© 2022 Company',
            child: const Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
