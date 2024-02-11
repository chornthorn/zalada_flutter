import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.selected = false,
    this.badgeCount = 0,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool selected;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 68,
          minHeight: 68,
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: selected ? Colors.grey[200] : Colors.transparent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                badgeCount > 0
                    ? Badge(
                        offset: const Offset(8, -5),
                        label: Text(
                          badgeCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Icon(
                          icon,
                          color: selected
                              ? Theme.of(context).primaryColor
                              : Colors.grey[600],
                        ),
                      )
                    : Icon(
                        icon,
                        color: selected
                            ? Theme.of(context).primaryColor
                            : Colors.grey[600],
                      ),
                const SizedBox(height: 3),
                Text(
                  label,
                  style: TextStyle(
                    color: selected
                        ? Theme.of(context).primaryColor
                        : Colors.grey[600],
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: selected ? 12.5 : 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
