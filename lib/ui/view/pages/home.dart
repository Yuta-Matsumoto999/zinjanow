import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/user/user_notifier.dart';
import 'package:zinjanow_app/ui/view/pages/main_page.dart';
import 'package:zinjanow_app/ui/view/pages/my_page.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  static const _pages = [
    MainPage(),
    MyPage()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userNotifierProvider.notifier).fetch();
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        currentIndex: _selectedIndex,
        onTap:_onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        type: BottomNavigationBarType.fixed,
      )
    );
  }
}