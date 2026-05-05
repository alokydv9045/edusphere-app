import 'package:flutter/material.dart';

class AssignmentBottomNav extends StatelessWidget {
  const AssignmentBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          AssignmentNavItem(
            icon: Icons.grid_view,
            label: 'Home',
            isActive: true,
          ),
          AssignmentNavItem(
            icon: Icons.calendar_today_outlined,
            label: 'Schedule',
          ),
          AssignmentNavItem(
            icon: Icons.chat_bubble_outline,
            label: 'Chat',
          ),
          AssignmentNavItem(
            icon: Icons.person_outline,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class AssignmentNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const AssignmentNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFF059669) : const Color(0xFF434655);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
