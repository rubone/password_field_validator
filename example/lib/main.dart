import 'package:flutter/material.dart';
import 'package:password_field_validator/password_field_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Field Validator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Password Field Validator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final TextEditingController passwordTextController = TextEditingController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Enter your password',
              ),
              TextField(
                controller: widget.passwordTextController,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: PasswordFieldValidator(
                  minLength: 8,
                  uppercaseCharCount: 2,
                  lowercaseCharCount: 1,
                  numericCharCount: 3,
                  specialCharCount: 2,
                  defaultColor: Colors.black,
                  successColor: Colors.green,
                  failureColor: Colors.red,
                  controller: widget.passwordTextController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
