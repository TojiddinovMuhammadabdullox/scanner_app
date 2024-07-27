import 'package:flutter/material.dart';
import 'package:qr_scanner_app/views/screens/generate_qr_scanner.dart';
import 'package:qr_scanner_app/views/screens/home_screen.dart';
import 'package:qr_scanner_app/views/screens/history_screen.dart'; // Import the HistoryScreen

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const GenerateQrScanner(),
    const HistoryScreen(), // Ensure HistoryScreen is added to the pages list
  ];

  void onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget buildTabIcon(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => onTapped(index),
          child: Icon(
            icon,
            size: 30,
            color: currentIndex == index
                ? const Color(0xffFDB623)
                : const Color(0xffD9D9D9),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: "itim",
            fontSize: 15,
            color: currentIndex == index
                ? const Color(0xffFDB623)
                : const Color(0xffD9D9D9),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTabIcon(Icons.qr_code_2_sharp, "Generate", 1),
            buildTabIcon(Icons.history, "History", 2),
          ],
        ),
      ),
    );
  }
}
