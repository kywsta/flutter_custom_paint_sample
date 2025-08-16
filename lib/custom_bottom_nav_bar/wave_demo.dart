import 'package:flutter/material.dart';
import 'package:flutter_custom_paint_sample/custom_bottom_nav_bar/wave_painter.dart';

void main() {
  runApp(MaterialApp(home: WaveDemoPage()));
}

// Example usage widget
class WaveWidget extends StatelessWidget {
  final int numberOfCurves;
  final Color waveColor;
  final double strokeWidth;
  final double amplitude;
  final double height;
  final bool startWithUp;

  const WaveWidget({
    Key? key,
    required this.numberOfCurves,
    this.waveColor = Colors.blue,
    this.strokeWidth = 3.0,
    this.amplitude = 50.0,
    this.height = 150.0,
    this.startWithUp = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: WavePainter(
          numberOfCurves: numberOfCurves,
          waveColor: waveColor,
          strokeWidth: strokeWidth,
          amplitude: amplitude,
          startWithUp: startWithUp,
        ),
      ),
    );
  }
}

// Demo page to showcase different wave configurations
class WaveDemoPage extends StatefulWidget {
  @override
  _WaveDemoPageState createState() => _WaveDemoPageState();
}

class _WaveDemoPageState extends State<WaveDemoPage> {
  int _numberOfCurves = 4;
  double _amplitude = 50.0;
  double _strokeWidth = 3.0;
  bool _startWithUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wave CustomPainter Demo'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Controls
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Number of Curves: $_numberOfCurves',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: _numberOfCurves.toDouble(),
                  min: 2,
                  max: 12,
                  divisions: 10,
                  onChanged: (value) {
                    setState(() {
                      _numberOfCurves = value.toInt();
                    });
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Amplitude: ${_amplitude.toInt()}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: _amplitude,
                  min: 20,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _amplitude = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Stroke Width: ${_strokeWidth.toInt()}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: _strokeWidth,
                  min: 1,
                  max: 10,
                  onChanged: (value) {
                    setState(() {
                      _strokeWidth = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Start Direction: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: _startWithUp,
                      onChanged: (value) {
                        setState(() {
                          _startWithUp = value;
                        });
                      },
                    ),
                    Text(_startWithUp ? 'Up' : 'Down'),
                  ],
                ),
              ],
            ),
          ),

          // Wave display
          Expanded(
            child: Center(
              child: WaveWidget(
                numberOfCurves: _numberOfCurves,
                amplitude: _amplitude,
                strokeWidth: _strokeWidth,
                waveColor: Colors.blue,
                startWithUp: _startWithUp,
              ),
            ),
          ),

          // Multiple examples
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Text(
                  'Different Wave Styles:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),

                Text(
                  '3 curves - Start Up:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                WaveWidget(
                  numberOfCurves: 3,
                  waveColor: Colors.red,
                  startWithUp: true,
                  height: 100,
                ),
                SizedBox(height: 8),

                Text(
                  '3 curves - Start Down:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                WaveWidget(
                  numberOfCurves: 3,
                  waveColor: Colors.red,
                  startWithUp: false,
                  height: 100,
                ),
                SizedBox(height: 16),

                Text(
                  '5 curves - Start Up:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                WaveWidget(
                  numberOfCurves: 5,
                  waveColor: Colors.green,
                  amplitude: 30,
                  startWithUp: true,
                  height: 100,
                ),
                SizedBox(height: 8),

                Text(
                  '6 curves - Start Down:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                WaveWidget(
                  numberOfCurves: 6,
                  waveColor: Colors.purple,
                  strokeWidth: 5,
                  amplitude: 40,
                  startWithUp: false,
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
