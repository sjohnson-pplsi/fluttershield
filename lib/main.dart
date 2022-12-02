import 'package:flutter/material.dart';
import 'package:fluttershield/call_firm_screen.dart';
import 'package:fluttershield/home_screen.dart';
import 'package:fluttershield/requests_screen.dart';

import 'login_screen.dart';
import 'stopwatch.dart';

void main() => runApp(const FlutterShield());

class FlutterShield extends StatelessWidget {
  const FlutterShield({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RootScreen());
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int index = 0;

  _selectScreen(int nextIndex) {
    setState(() {
      index = nextIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: _selectScreen,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: ""),
            NavigationDestination(icon: Icon(Icons.folder), label: ""),
            NavigationDestination(icon: Icon(Icons.call), label: ""),
            NavigationDestination(icon: Icon(Icons.inbox), label: ""),
            NavigationDestination(icon: Icon(Icons.account_circle), label: ""),
          ]),
      body: _screen(),
    );
  }

  Widget? _screen() {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const RequestsScreen();
      case 2:
        return const CallFirmScreen();
      case 3:
      // return const LoginScreen();
      case 4:
      // return const StopWatch();
      default:
        return null;
    }
  }
}
