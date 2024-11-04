import 'package:flutter/material.dart';
import 'astrology_home_page.dart';
import 'user_profile_page.dart';
import 'user.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final User user = User(
    name: 'Иван Иванов',
    login: 'ivan_ivanov',
    password: 'password123',
    dateOfBirth: '1990-01-01',
  );

  final List<Widget> _pages = [
    AstrologyHomePage(user: User(
      name: 'Иван Иванов',
      login: 'ivan_ivanov',
      password: 'password123',
      dateOfBirth: '1990-01-01',
    )),
    UserProfilePage(user: User(
      name: 'Иван Иванов',
      login: 'ivan_ivanov',
      password: 'password123',
      dateOfBirth: '1990-01-01',
    )),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
