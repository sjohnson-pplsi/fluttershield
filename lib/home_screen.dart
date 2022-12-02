import 'package:flutter/material.dart';
import 'package:fluttershield/large_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    // ["#5D5FD1", "#9820E1", "#A55DE2"
                    Color(0xff5D5FD1),
                    Color(0xff9820E1),
                    Color(0xffA55DE2),
                  ])),
              // color: Color(0xff7249d6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  _descriptionText(),
                  _buttonContainer(),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 16, top: 34, right: 16, bottom: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _entitlementTitle(),
                    _entitlementDescription(),
                    Image.asset('assets/family.png'),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: const Text(
        "Get legal\nhelp now",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'SwiftJustice',
            fontSize: 56,
            height: 1),
      ),
    );
  }

  Widget _descriptionText() {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 80),
      child: const Text(
          "Legal issues can be confusing, complicated, and even a little embarrassing.  We are here to help",
          style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }

  Widget _buttonContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: LargeButton(text: "Request a consult"),
    );
  }

  Widget _entitlementTitle() {
    return Container(
        padding: EdgeInsets.only(),
        child: Text("Explore your features",
            style: TextStyle(color: Colors.white, fontSize: 20)));
  }

  Widget _entitlementDescription() {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 16),
      child: Text(
          "Want to better understand your plan?  We've got you covered.",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              height: 1.5)),
    );
  }
}
