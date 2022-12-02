import 'package:flutter/material.dart';
import 'package:fluttershield/components/large_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            EntitlementFeature(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xff5D5FD1),
            Color(0xff9820E1),
            Color(0xffA55DE2),
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Header(),
          DescriptionText(),
          ButtonContainer(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: const Text(
        "Get legal help now",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'SwiftJustice',
            fontSize: 56,
            height: 1),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 80),
      child: const Text(
          "Legal issues can be confusing, complicated, and even a little embarrassing.  We are here to help",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          )),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: const LargeButton(text: "Request a consult"),
    );
  }
}

class EntitlementFeature extends StatelessWidget {
  const EntitlementFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 34, right: 16, bottom: 50),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const EntitlementTitle(),
        const EntitlementDescription(),
        Image.asset('assets/family.png'),
      ]),
    );
  }
}

class EntitlementTitle extends StatelessWidget {
  const EntitlementTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(),
        child: const Text("Explore your features",
            style: TextStyle(color: Colors.white, fontSize: 20)));
  }
}

class EntitlementDescription extends StatelessWidget {
  const EntitlementDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: const Text(
          "Want to better understand your plan?  We've got you covered.",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              height: 1.5)),
    );
  }
}
