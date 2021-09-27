import 'package:flutter/material.dart';
import 'package:retrofit_exam/RoutePage.dart';

class EventMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이벤트 메인 화면"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      RoutePage.movePage(RoutePage.EVENT_A);
                    },
                    child: Text("이벤트 타입 A")),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      RoutePage.movePage(RoutePage.EVENT_B);
                    },
                    child: Text("이벤트 타입 B")),
              ),
              SizedBox(height: 30),
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("이벤트 타입 C"))),
              SizedBox(height: 30),
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("이벤트 타입 D"))),
              SizedBox(height: 30),
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("이벤트 타입 E"))),
            ],
          ),
        ),
      ),
    );
  }
}
