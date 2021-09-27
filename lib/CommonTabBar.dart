import 'package:flutter/material.dart';

///공통 탭바
class CommonTabBar {
  CommonTabBar(this.tabLabelList);

  List<String> tabLabelList = [];

  Widget create() {
    return TabBar(
      tabs: tabList(),
      labelPadding: EdgeInsets.symmetric(horizontal: 16),
      indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      unselectedLabelColor: const Color(0xffe0e0e0),
      isScrollable: true,
    );
  }

  ///tabLabel 리스트로 textWidgetList 생성
  List<Widget> tabList() {
    List<Widget> tabs = [];
    for (String text in tabLabelList) {
      tabs.add(
        Container(
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          height: 60,
          child: Text(text),
        ),
      );
    }
    return tabs;
  }
}
