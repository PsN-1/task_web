import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CreationDonePage extends StatelessWidget {
  const CreationDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Colors.white,
          elevation: 1,
          child: Padding(
              padding: const EdgeInsets.all(1),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                     SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                          child: FlareActor("assets/success_check.flr",
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                              animation: "Untitled")),
                    ),
                     Text(
                      "Pesquisa Criada com Sucesso!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ));
  }
}
