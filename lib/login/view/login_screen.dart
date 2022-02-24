import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/components/styles/theme.dart' as Theme;
import 'package:task_mobile/constants/constants.dart';
import 'package:task_mobile/models/user_data.dart';
import 'package:task_mobile/models/user_manager.dart';
import 'package:task_mobile/ui/home_page.dart';
import 'package:task_mobile/utils/validators.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late bool _obscureTextLogin = true;

  String titleButton = "Entrar";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(body: Consumer<UserManager>(
      builder: (_, userManager, __) {
        return Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: ListView(
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/taskweb.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Form(
                      key: formKey,
                      child: ListView(
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            // enabled: !userManager.loading,
                            decoration: const InputDecoration(
                              hintText: "E-mail",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.mail,
                                color: Colors.black,
                                size: 22.0,
                              ),
                            ),
                            autocorrect: false,
                            validator: (email) {
                              if (!emailValid(email!)) return "E-mail inválido";
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            // enabled: !userManager.loading,
                            decoration: const InputDecoration(
                              hintText: "Senha",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                size: 22.0,
                                color: Colors.black,
                              ),
                            ),
                            autocorrect: false,
                            obscureText: true,
                            validator: (password) {
                              if (password!.length <= 5)
                                return "Senha Invalida";
                            },
                          ),
                        ],
                      )),
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
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: <BoxShadow>[
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
                          titleButton,
                          style: TextStyle(
                              shadows: const <Shadow>[
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<UserManager>().context = context;
                          userManager.signIn(
                              user: UserData(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim()),
                              onFail: (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Ops! $e")));
                              }

                              // Navigator.pushNamed(context, "/home");
                              );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }
}
