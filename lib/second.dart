import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordcofirmController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Form(
        key: _formKey,

        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150.0),
            TextFormField(
              decoration: InputDecoration(
                  filled:true,
                  border: UnderlineInputBorder(),
                  labelText: 'Username'
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter enter Username';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                  filled:true,
                  border: UnderlineInputBorder(),
                  labelText: 'Password'
              ),
              obscureText: true,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                  filled:true,
                  border: UnderlineInputBorder(),
                  labelText: 'Confirm Password'
              ),
              obscureText: true,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Confirm Password';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                  filled:true,
                  border: UnderlineInputBorder(),
                  labelText: 'Email Address'
              ),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email Address';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200.0, 20.0, 10.0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( primary: Colors.grey[300], // background
                  onPrimary: Colors.black),

                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// TODO: Add AccentColorOverride (103)
