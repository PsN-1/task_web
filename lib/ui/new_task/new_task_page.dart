import 'package:flutter/material.dart';
import 'package:task_mobile/ui/new_task/pages/forms_page.dart';

class NewTaskPage extends StatelessWidget {
  NewTaskPage({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nova Tarefa"),
        ),
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/fundo_colors.png"),
                        fit: BoxFit.cover)),
                child: null),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: PageView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  FormsPage(),
                  FormsPage(),
                  
                ],
              ),
            )
          ],
        ));
  }
}
