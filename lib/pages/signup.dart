import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';
import '../widgets/stateless/simple_button.dart';


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
        body: BlocBuilder<AppCubits, CubitStates>(
            builder: (context, state) {
              return Column(
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
                              onPressed: () =>
                              {
                                print('Pressed ' + _emailController.text + ' ' +
                                    _passwordController.text)
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
                              onPressed: () =>
                              {
                                BlocProvider.of<AppCubits>(context).goHome(3)
                              },
                              height: 50,
                            )
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
        )
    );
  }
}
