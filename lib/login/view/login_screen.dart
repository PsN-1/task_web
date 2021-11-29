import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_mobile/components/styles/theme.dart' as Theme;
import 'package:task_mobile/constants/constants.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();

  final _senhaController = TextEditingController();

  late bool _obscureTextLogin = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: ListView(
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/taskweb.png')),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.mail,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: "E-mail",
                            hintStyle: TextStyle(
                                fontFamily: "Georgia", fontSize: 17.0),
                          ),
                        ),
                        TextField(
                          controller: _senhaController,
                          keyboardType: TextInputType.number,
                          obscureText: _obscureTextLogin,
                          style: const TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: "Senha",
                              hintStyle: TextStyle(
                                  fontFamily: "Georgia", fontSize: 17.0),
                              suffixIcon: InkWell(
                                onTap: _toggleLogin,
                                child: Icon(
                                  _obscureTextLogin
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye,
                                  size: 15.0,
                                  color: _obscureTextLogin
                                      ? Colors.black
                                      : Colors.blue,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  width: 200,
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.blue,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                      BoxShadow(
                        color: Theme.Colors.loginGradientEnd,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.purple],
                        begin: FractionalOffset(0.2, 0.2),
                        end: FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                    highlightColor: Colors.red,

                    elevation: 5,
                    splashColor: Colors.blue,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )
                            ],
                            color: Colors.white.withRed(244),
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }
}
