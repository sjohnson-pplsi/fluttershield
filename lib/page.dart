import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const RequestsScreen({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _title(),
        child,
      ]),
    );
  }

  Widget _title() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
    );
  }
}
