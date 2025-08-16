import 'package:flutter/material.dart';
import 'package:flutter_custom_paint_sample/custom_bottom_nav_bar/wavy_bottom_nav_painter.dart';

class WavyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<WavyBottomNavItem> items;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final int numberOfCurves;
  final double waveAmplitude;
  final bool startWaveWithUp;
  final double height;

  const WavyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor = Colors.white,
    this.selectedItemColor = Colors.blue,
    this.unselectedItemColor = Colors.grey,
    this.numberOfCurves = 6,
    this.waveAmplitude = 10.0,
    this.startWaveWithUp = true,
    this.height = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // Wavy background
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, height),
            painter: WavyBottomNavPainter(
              numberOfCurves: numberOfCurves,
              backgroundColor: backgroundColor,
              amplitude: waveAmplitude,
              startWithUp: startWaveWithUp,
            ),
          ),

          // Navigation items
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: waveAmplitude),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isSelected = index == currentIndex;

                  return GestureDetector(
                    onTap: () => onTap(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item.icon,
                            color: isSelected
                                ? selectedItemColor
                                : unselectedItemColor,
                            size: 24,
                          ),
                          SizedBox(height: 4),
                          Text(
                            item.label,
                            style: TextStyle(
                              color: isSelected
                                  ? selectedItemColor
                                  : unselectedItemColor,
                              fontSize: 12,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WavyBottomNavItem {
  final IconData icon;
  final String label;

  const WavyBottomNavItem({required this.icon, required this.label});
}
