import 'package:flutter/material.dart';
import 'package:fluttershield/components/large_button.dart';

class CallFirmScreen extends StatelessWidget {
  const CallFirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 16, right: 8, bottom: 16, left: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Text('Call your law firm',
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Open a request over the phone",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 1.5)),
                      Text("Firms are open 8:30am - 5pm",
                          style: TextStyle(fontSize: 16, height: 1.5)),
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: LargeButton(text: "Call law firm"),
                      )
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Emergency legal access",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 1.5)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text("24 hours a day, 7 days a week",
                            style: TextStyle(fontSize: 16, height: 1.5)),
                      ),
                      Text(
                          "Legal consultation for covered legal emergencies such as if you're:",
                          style: TextStyle(fontSize: 16, height: 1.5)),
                      UnorderedList([
                        "Arrested or detained",
                        "Seriously injured",
                        "Served with a warrant",
                        "Threatened to have your children taken away"
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: LargeButton(
                            text: "Call emergency line",
                            type: LargeButtonType.secondary),
                      )
                    ]),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts, {super.key});
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• ", style: TextStyle(fontSize: 16, height: 1.5)),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 16, height: 1.5)),
        ),
      ],
    );
  }
}
