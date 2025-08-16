import 'package:flutter/material.dart';
import 'package:flutter_custom_paint_sample/custom_bottom_nav_bar/wavy_bottom_navigation_bar.dart';

void main() {
  runApp(MaterialApp(home: WavyBottomNavDemo()));
}

// Demo app showcasing the wavy bottom navigation bar
class WavyBottomNavDemo extends StatefulWidget {
  const WavyBottomNavDemo({super.key});

  @override
  State<WavyBottomNavDemo> createState() => _WavyBottomNavDemoState();
}

class _WavyBottomNavDemoState extends State<WavyBottomNavDemo> {
  int _currentIndex = 0;
  int _numberOfCurves = 6;
  double _waveAmplitude = 10.0;
  bool _startWaveWithUp = true;

  final List<WavyBottomNavItem> _navItems = [
    WavyBottomNavItem(icon: Icons.home, label: 'Home'),
    WavyBottomNavItem(icon: Icons.search, label: 'Search'),
    WavyBottomNavItem(icon: Icons.favorite, label: 'Favorites'),
    WavyBottomNavItem(icon: Icons.person, label: 'Profile'),
  ];

  final List<Widget> _pages = [
    _buildPage('Home', Colors.blue[50]!, Icons.home),
    _buildPage('Search', Colors.green[50]!, Icons.search),
    _buildPage('Favorites', Colors.red[50]!, Icons.favorite),
    _buildPage('Profile', Colors.purple[50]!, Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Main content area
              ConstrainedBox(
                constraints: BoxConstraints.expand(height: 300),
                child: _pages[_currentIndex],
              ),

              // Wave customization controls
              Container(
                color: Colors.grey[100],
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wave Customization',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),

                    Text('Curves: $_numberOfCurves'),
                    Slider(
                      value: _numberOfCurves.toDouble(),
                      min: 2,
                      max: 10,
                      divisions: 8,
                      onChanged: (value) {
                        setState(() {
                          _numberOfCurves = value.toInt();
                        });
                      },
                    ),

                    Text('Wave Height: ${_waveAmplitude.toInt()}'),
                    Slider(
                      value: _waveAmplitude,
                      min: 10,
                      max: 40,
                      onChanged: (value) {
                        setState(() {
                          _waveAmplitude = value;
                        });
                      },
                    ),

                    Row(
                      children: [
                        Text('Start Direction: '),
                        Switch(
                          value: _startWaveWithUp,
                          onChanged: (value) {
                            setState(() {
                              _startWaveWithUp = value;
                            });
                          },
                        ),
                        Text(_startWaveWithUp ? 'Up' : 'Down'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // The wavy bottom navigation bar
      bottomNavigationBar: WavyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navItems,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[900]!,
        numberOfCurves: _numberOfCurves,
        waveAmplitude: _waveAmplitude,
        startWaveWithUp: _startWaveWithUp,
        height: 100,
      ),
    );
  }

  static Widget _buildPage(String title, Color color, IconData icon) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.grey[700]),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Alternative wavy bottom nav with elevated style
class ElevatedWavyBottomNavigationBar extends StatelessWidget {
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
  final double elevation;

  const ElevatedWavyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor = Colors.white,
    this.selectedItemColor = Colors.blue,
    this.unselectedItemColor = Colors.grey,
    this.numberOfCurves = 6,
    this.waveAmplitude = 20.0,
    this.startWaveWithUp = true,
    this.height = 80.0,
    this.elevation = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: WavyBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
        backgroundColor: backgroundColor,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        numberOfCurves: numberOfCurves,
        waveAmplitude: waveAmplitude,
        startWaveWithUp: startWaveWithUp,
        height: height,
      ),
    );
  }
}
