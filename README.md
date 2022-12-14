# Password Field Validator
[![License](https://img.shields.io/github/license/leisim/logger?logo=open-source-initiative&logoColor=green)](https://github.com/rubone/password_field_validator/blob/master/LICENSE)
![Pub Version](https://img.shields.io/pub/v/password_field_validator)
![Code Size](https://img.shields.io/github/languages/code-size/rubone/password_field_validator)
![GitHub stars](https://img.shields.io/github/stars/rubone/password_field_validator)

Password Field Validator help you to validate a passwords with your rules.

## Validations

- `Minimum length`
- `Uppercase count`
- `Lowercase count`
- `Numeric characters`
- `Special characters`

![Gif044](https://user-images.githubusercontent.com/1043247/185675524-5177a165-fa20-4352-919a-7724d1ea1f1d.gif)
![Gif055](https://user-images.githubusercontent.com/1043247/185675593-cdc94103-91b8-48f6-a3fa-ca1ee66a479f.gif)


## Getting started

### 1. Add it to your package's pubspec.yaml file
```yml
dependencies:
  password_field_validator: 0.0.1
```
### 2. Install packages
```sh
flutter pub get
```

### 3. Import package
```dart
import 'package:password_field_validator/password_field_validator.dart';
```

## Usage

Now just add it after your TextField and pass the controller

```dart
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

```

## Example

You can find a simple example [here](https://github.com/rubone/password_field_validator/tree/main/example)
