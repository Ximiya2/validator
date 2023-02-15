import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Validator(),
    );
  }
}

class Validator extends StatefulWidget {
  const Validator({Key? key}) : super(key: key);

  @override
  State<Validator> createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  final TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validation Example'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.blue.shade700,
                    hintText: 'Enter your name',
                    labelText: 'Name',
                    //suffixStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      // borderRadius: const BorderRadius.all(
                      //   Radius.circular(20.0),
                      // ),
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed:(){ if(_formKey.currentState!.validate()){
                    }
                    },
                    child: Text("Submit")
                )
              ],
            )
        ),
      ),
    );
  }
}

