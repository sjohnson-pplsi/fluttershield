import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final LargeButtonType type;

  const LargeButton({
    super.key,
    required this.text,
    this.type = LargeButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(
              type == LargeButtonType.primary
                  ? Colors.black
                  : const Color(0xffCE0220))),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

enum LargeButtonType {
  primary,
  secondary,
}
