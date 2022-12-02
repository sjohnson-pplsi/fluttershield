import 'package:flutter/material.dart';
import 'package:fluttershield/stopwatch.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name ?? "Login")),
        body: Center(
          child: _buildLoginform(),
        ));
  }

  Widget _buildLoginform() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Runner"),
              validator: (text) =>
                  text!.isEmpty ? "Enter the runner's name." : null,
              onFieldSubmitted: (value) => _validate(),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "Email"),
              validator: (text) {
                if (text!.isEmpty) {
                  return "Enter the runner's email.";
                }

                final regex = RegExp('[^@]+@[^\.]+\..+');
                if (!regex.hasMatch(text)) {
                  return "Enter a valid email";
                }

                return null;
              },
              onFieldSubmitted: (value) => _validate(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _validate,
              child: const Text("Continue"),
            )
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }

    final name = _nameController.text;
    Navigator.of(context)
        .pushReplacementNamed(StopWatch.route, arguments: name);
  }
}
