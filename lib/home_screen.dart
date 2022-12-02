import 'package:flutter/material.dart';
import 'package:fluttershield/components/large_button.dart';

const heroTitle = "Get legal help now";
const heroDescription =
    "Legal issues can be confusing, complicated, and even a little embarrassing.  We are here to help";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor:
            constraints.maxWidth > 800 ? Colors.white : Colors.black,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: const [
                HeroSection(),
                EntitlementFeature(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: constraints.maxWidth > 800 ? 800 : double.infinity,
            padding: constraints.maxWidth > 800
                ? EdgeInsets.only(left: 160, right: 160, top: 50, bottom: 50)
                : const EdgeInsets.only(left: 16, right: 16, bottom: 5),
            margin: constraints.maxWidth > 800
                ? EdgeInsets.only(top: 50)
                : EdgeInsets.all(0),
            decoration: BoxDecoration(
                borderRadius: constraints.maxWidth > 800
                    ? const BorderRadius.all(Radius.circular(10))
                    : const BorderRadius.all(Radius.circular(0)),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff5D5FD1),
                      Color(0xff9820E1),
                      Color(0xffA55DE2),
                    ])),
            child: Column(
              crossAxisAlignment: constraints.maxWidth > 800
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: const [
                Header(),
                DescriptionText(),
                ButtonContainer(),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: const Text(
        heroTitle,
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
      child: const Text(heroDescription,
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
    return LayoutBuilder(builder: (context, constraints) {
      final desktop = constraints.maxWidth > 800;
      return Container(
        width: desktop ? 800 : double.infinity,
        padding:
            const EdgeInsets.only(left: 16, top: 34, right: 16, bottom: 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          EntitlementTitle(desktop: desktop),
          EntitlementDescription(desktop: desktop),
          Image.asset('assets/family.png'),
        ]),
      );
    });
  }
}

class EntitlementTitle extends StatelessWidget {
  final bool desktop;

  const EntitlementTitle({
    super.key,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(),
        child: Text("Explore your features",
            style: TextStyle(
                color: desktop ? Colors.black : Colors.white, fontSize: 20)));
  }
}

class EntitlementDescription extends StatelessWidget {
  final bool desktop;

  const EntitlementDescription({
    super.key,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Text(
          "Want to better understand your plan?  We've got you covered.",
          style: TextStyle(
              color: desktop ? Colors.black : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              height: 1.5)),
    );
  }
}
