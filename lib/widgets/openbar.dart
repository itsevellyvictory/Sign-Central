import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const inactiveColor = Color(0xFF4B5563);
    const activeColor = Color(0xFFFFA000); // laranja do home

    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomNavItem(
            icon: Icons.home_rounded,
            index: 0,
            currentIndex: currentIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onTap: onTap,
          ),
          _BottomNavItem(
            icon: Icons.menu_book_rounded,
            index: 1,
            currentIndex: currentIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onTap: onTap,
          ),
          _BottomNavItem(
            icon: Icons.article_rounded,
            index: 2,
            currentIndex: currentIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onTap: onTap,
          ),
          _BottomNavItem(
            icon: Icons.person_rounded,
            index: 3,
            currentIndex: currentIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int> onTap;

  const _BottomNavItem({
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;
    final color = isActive ? activeColor : inactiveColor;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Icon(
          icon,
          color: color,
          size: 26,
        ),
      ),
    );
  }
}
