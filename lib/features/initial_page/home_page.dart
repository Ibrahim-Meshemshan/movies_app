import 'package:flutter/material.dart';
import 'package:movies_app/features/initial_page/search_screen/page/screen/search_screen.dart';
import 'package:movies_app/features/initial_page/wishlist_screen/page/watch_list_screen.dart';
import 'home_screen/page/screen/home_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  final List<Widget> screens =  [
    HomeScreen(),
    SearchScreen(),
    WatchListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              selectedIndex.value = value;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: 'Wishlist'),
            ],
          );
        },
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, value, child) {
          return screens[value];
        },
      ),
    );
  }
}
