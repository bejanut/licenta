import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/AppState.dart';
import '../state/actions/products_actions/change-user-page.dart';
import '../state/actions/user_data_actions/thunk_authenticate.dart';
import '../widgets/stateless/simple_button.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        converter: (store) => store.state.userDataState.isWaiting,
        builder: (_, isWaiting) {
          if (isWaiting) {
            return Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                        child: const Text("LogIn",
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
                      StoreConnector<AppState, DispatchFunc>(
                        converter: (store) => () => store.dispatch(logIn(_emailController.text, _passwordController.text, context)),
                        builder: (_, logIn) {
                          return Container(
                              width: double.infinity,
                              child: SimpleRoundedButton(
                                fontSize: 18,
                                text: 'Log In',
                                onPressed: logIn,
                                height: 50,
                              )
                          );
                        }),
                      SizedBox(height: 15,),
                      Container(
                        width: double.infinity,
                        child: StoreConnector<AppState, DispatchFunc>(
                          converter: (store) => () => store.dispatch(ChangeUserPage(UserPageStates.register)),
                          builder: (_, goToLogIn) {
                            return Container(
                              width: double.infinity,
                              child: SimpleRoundedButton(
                                fontSize: 18,
                                text: 'Register',
                                onPressed: goToLogIn,
                                height: 50,
                              ),
                            );
                          }
                        )
                      ),
                    ],
                  ),
                )
              ],
            )
          );
    });
  }
}
