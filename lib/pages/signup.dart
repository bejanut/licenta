import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../small_widgets/simple_button.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child: const Text("SignUp",
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold
                      ),),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35, left: 20, right: 30),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        )
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 40,),
                  Container(
                      width: double.infinity,
                      child: SimpleRoundedButton(
                        fontSize: 18,
                        text: 'Register',
                        onPressed: () => {
                          print('Pressed ' + _emailController.text + ' ' + _passwordController.text)
                        },
                        height: 50,
                      )
                  ),
                  SizedBox(height: 15,),
                  Container(
                      width: double.infinity,
                      child: SimpleRoundedButton(
                        fontSize: 18,
                        text: 'Go Back',
                        onPressed: () => {Navigator.of(context).pop()},
                        height: 50,
                      )
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
