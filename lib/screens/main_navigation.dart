import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'client_screen.dart';
import 'voice_screen.dart';
import 'schedule_screen.dart';
import 'insight_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      // Voice recording screen is navigated differently or just shown
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VoiceScreen()),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101622),
      body: IndexedStack(
        index: _currentIndex > 2 ? _currentIndex : _currentIndex,
        children: const [
          HomeScreen(),
          ClientScreen(),
          SizedBox(), // Placeholder for Voice (index 2)
          ScheduleScreen(),
          InsightScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(2),
        backgroundColor: const Color(0xFF135BEC),
        elevation: 4,
        child: const Icon(Icons.mic, color: Colors.white, size: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withOpacity(0.95), // bg-slate-900/95
          border: const Border(
            top: BorderSide(
              color: Color(0xFF1E293B),
              width: 1.0,
            ), // border-slate-800
          ),
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, Icons.home, 'Home', 0),
              _buildNavItem(Icons.people_outline, Icons.people, 'Clients', 1),
              const SizedBox(width: 48), // Space for FAB
              _buildNavItem(
                Icons.calendar_today_outlined,
                Icons.calendar_today,
                'Calendar',
                3,
              ),
              _buildNavItem(
                Icons.insights_outlined,
                Icons.insights,
                'Insights',
                4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected
                ? const Color(0xFF135BEC)
                : const Color(0xFF94A3B8), // text-slate-400
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? const Color(0xFF135BEC)
                  : const Color(0xFF94A3B8), // text-slate-400
            ),
          ),
        ],
      ),
    );
  }
}
