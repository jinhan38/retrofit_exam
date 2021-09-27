import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RoutePage.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("기획전/이벤트 테스트")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("기획전"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    RoutePage.movePage(RoutePage.EVENT_MAIN);
                  },
                  child: Text("이벤트"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
