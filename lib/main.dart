import 'package:flutter/material.dart';
import 'package:fluttershield/call_firm_screen.dart';
import 'package:fluttershield/home_screen.dart';
import 'package:fluttershield/requests_screen.dart';

void main() => runApp(const FlutterShield());

class FlutterShield extends StatelessWidget {
  const FlutterShield({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const RootScreen(),
        theme: ThemeData(
            backgroundColor: Colors.white,
            canvasColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 1,
            )));
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class Destination {
  final String label;
  final Icon icon;

  const Destination({required this.icon, required this.label});
}

class _RootScreenState extends State<RootScreen> {
  int index = 0;
  final List<Destination> destinations = const [
    Destination(icon: Icon(Icons.home), label: "Home"),
    Destination(icon: Icon(Icons.folder), label: "Requests"),
    Destination(icon: Icon(Icons.call), label: "Call Firm"),
    Destination(icon: Icon(Icons.inbox), label: "Inbox"),
    Destination(icon: Icon(Icons.account_circle), label: "Profile"),
  ];

  _selectScreen(int nextIndex) {
    setState(() {
      index = nextIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      if (dimens.maxWidth >= 600) {
        return Scaffold(
          appBar: AppBar(
              title: Row(
            children: [
              Image.asset("assets/logo.png"),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Legal",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: null,
                  icon:
                      Icon(Icons.help_outline_outlined, color: Colors.black54)),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.black54,
                  )),
              Text("User", style: TextStyle(color: Colors.black54))
            ],
          )),
          body: Row(children: [
            NavigationRail(
                elevation: 1,
                extended: dimens.maxWidth >= 800,
                minExtendedWidth: 180,
                selectedIndex: index,
                onDestinationSelected: _selectScreen,
                destinations: destinations
                    .map((e) => NavigationRailDestination(
                        icon: e.icon, label: Text(e.label)))
                    .toList()),
            Expanded(child: _screen() ?? Container()),
          ]),
        );
      }
      return Scaffold(
        bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: _selectScreen,
            destinations: destinations
                .map((e) => NavigationDestination(icon: e.icon, label: e.label))
                .toList()),
        body: _screen(),
      );
    });
  }

  Widget? _screen() {
    switch (index) {
      case 0:
        return const SafeArea(child: HomeScreen());
      case 1:
        return const SafeArea(child: RequestsScreen());
      case 2:
        return const SafeArea(child: CallFirmScreen());
      case 3:
      // return const LoginScreen();
      case 4:
      // return const StopWatch();
      default:
        return null;
    }
  }
}
