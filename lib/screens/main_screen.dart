import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'tabs/tab1_screen.dart';
import 'tabs/tab2_screen.dart';
import 'tabs/tab3_screen.dart';
import 'tabs/tab4_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Tab1Screen(),
    Tab2Screen(),
    Tab3Screen(),
    Tab4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppTheme.surfaceColor,
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.2),
        destinations: [
        NavigationDestination(
          icon: const Icon(Icons.mic_none_outlined),
          selectedIcon: const Icon(Icons.mic, color: AppTheme.primaryColor),
          label: 'Pacer',
        ),
        NavigationDestination(
          icon: const Icon(Icons.record_voice_over_outlined),
          selectedIcon: const Icon(Icons.record_voice_over, color: AppTheme.primaryColor),
          label: 'Warmup',
        ),
        NavigationDestination(
          icon: const Icon(Icons.speed_outlined),
          selectedIcon: const Icon(Icons.speed, color: AppTheme.primaryColor),
          label: 'Clarity',
        ),
        NavigationDestination(
          icon: const Icon(Icons.graphic_eq_outlined),
          selectedIcon: const Icon(Icons.graphic_eq, color: AppTheme.primaryColor),
          label: 'History',
        ),

        ],
      ),
    );
  }
}
