import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import your home screen file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _step = 0;

  @override
  void initState() {
    super.initState();
    _startAnimationSequence();
  }

  void _startAnimationSequence() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_step < 2) {
        setState(() => _step++);
      } else {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: _buildStep(isDarkMode),
        ),
      ),
    );
  }

  Widget _buildStep(bool isDarkMode) {
    String suffix = isDarkMode ? '_dark' : '';
    String assetName;
    double width;

    switch (_step) {
      case 0:
        assetName = 'assets/boozin1$suffix.png';
        width = 100;
        break;
      case 1:
        assetName = 'assets/boozin2$suffix.png';
        width = 200;
        break;
      case 2:
      default:
        assetName = 'assets/boozin3$suffix.png';
        width = 200;
        break;
    }

    return Image.asset(
      assetName,
      key: ValueKey(assetName),
      width: width,
    );
  }
}
