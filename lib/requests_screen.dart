import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _title(),
        _description(),
        Expanded(
            child: ListView(children: [
          _serviceRequest(),
          _serviceRequest(),
          _serviceRequest()
        ]))
      ]),
    );
  }

  Widget _title() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text("Requests",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
    );
  }

  Widget _description() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text("Manage your recent service requests",
          style: TextStyle(fontSize: 20)),
    );
  }

  Widget _serviceRequest() {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffeeeeee), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: ListTile(
          leading: Container(
              // padding: EdgeInsets.all(8),
              child: Image.asset("assets/service_request.png")),
          title: Text("Service Request",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("November 8th, 2022, 4:18pm"),
              Text("Reference # AZ-7J9-2YC"),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          ),
        ));
  }
}
