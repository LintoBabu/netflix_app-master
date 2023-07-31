import 'package:flutter/material.dart';

ValueNotifier<int> indexChangenotfier = ValueNotifier(0);

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangenotfier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              onTap: (index) {
                indexChangenotfier.value = index;
              },
              currentIndex: newIndex,
              selectedItemColor: Colors.white,
              elevation: 0,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections), label: "New & Hot"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: "Fast Laughs"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download_for_offline), label: "Downloads"),
              ]);
        });
  }
}
