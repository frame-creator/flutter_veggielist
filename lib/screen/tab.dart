import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  const TabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          showSelectedLabels: true,
          selectedItemColor: Colors.amber,
          onTap: (index) {
            print(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              activeIcon: Icon(Icons.food_bank),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_outlined),
              activeIcon: Icon(Icons.featured_play_list),
              label: '등록',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              activeIcon: Icon(Icons.book_rounded),
              label: 'MY',
            ),
          ]),
    );
  }
}
