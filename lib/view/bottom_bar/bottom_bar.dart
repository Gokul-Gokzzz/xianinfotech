// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ui/view/notification_screen/notifiaction.dart';
import 'package:ui/view/home_screen/home.dart';
import 'package:ui/view/note_screen/note.dart';
import 'package:ui/view/profile_screen/profile.dart';
import 'package:ui/view/settings_screen/settings.dart';

class BottombarScreens extends StatefulWidget {
  const BottombarScreens({super.key});

  @override
  __BottombarScreensState createState() => __BottombarScreensState();
}

class __BottombarScreensState extends State<BottombarScreens> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const NoteScreen(),
    const SettingsScreen(),
    const NotificationScreen(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: _currentPageIndex,
            onTap: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            items: [
              buildBottomNavigationBarItem(
                  imagePath: 'assets/home.png', index: 0),
              buildBottomNavigationBarItem(
                  imagePath: 'assets/grid.png', index: 1),
              buildBottomNavigationBarItem(
                  imagePath: 'assets/document-removebg-preview.png', index: 2),
              buildBottomNavigationBarItem(
                  imagePath: 'assets/storage-removebg-preview.png', index: 3),
              buildBottomNavigationBarItem(
                  imagePath: 'assets/user.png', index: 4),
            ],
          ),
        ),
      ),
      body: _pages[_currentPageIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required String imagePath, required int index}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPageIndex == index
                ? Colors.blue.shade50
                : Colors.transparent,
          ),
          padding: const EdgeInsets.all(10),
          child: ImageIcon(
            AssetImage(imagePath),
            color: Colors.blue,
          ),
        ),
      ),
      label: '',
    );
  }
}
