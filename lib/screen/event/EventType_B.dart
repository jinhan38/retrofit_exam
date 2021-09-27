import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../CommonTabBar.dart';
import '../../MyCustomHeader.dart';

class EventType_B extends StatelessWidget {
  String listImageUrl =
      "https://pood-bucket.s3.ap-northeast-2.amazonaws.com/product/20210524184906049-4f6d8315-4524-404a-8d0b-b86c2f3c6191.jpeg";
  String detailImageUrl =
      "https://pood-bucket.s3.ap-northeast-2.amazonaws.com/product/20210513151308013-65605d21-103b-4d99-a7a0-d4c46a6f3c8f.jpeg";

  List<String> tabLabelList = ["첫번째", "두번째", "세번째", "네번째"];
  List<Widget> tabList = [
    Text("첫번째"),
    Text("두번째"),
    Text("세번째"),
    Text("네번째"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이벤트 타입 B"),
      ),
      body: DefaultTabController(
        length: tabLabelList.length,
        child: setNestedScrollView(),
      ),
    );
  }

  Widget header() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "이벤트 타입 B 타이틀",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Text("2021.11.11 ~ 2021.12.12"),
          SizedBox(height: 20),
          fadeImageWidget(detailImageUrl),
          SizedBox(height: 20),

        ],
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "이벤트 타입 B 타이틀",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Text("2021.11.11 ~ 2021.12.12"),
          SizedBox(height: 20),
          fadeImageWidget(detailImageUrl),
          SizedBox(height: 20),
          DefaultTabController(
            length: tabLabelList.length,
            child: setNestedScrollView(),
          ),
        ],
      ),
    );
  }

  NestedScrollView setNestedScrollView() {
    return NestedScrollView(
      body: setTabBarView(),
      headerSliverBuilder: (context, isScrolled) {
        return [
          ///헤더
          header(),

          ///탭바
          tabBar(),
        ];
      },
    );
  }

  ///탭바뷰
  Widget setTabBarView() {
    return TabBarView(
      children: List.generate(
        tabLabelList.length,
        (index) => Container(
          padding: EdgeInsets.only(top: 1),
          width: double.infinity,
          child: SingleChildScrollView(
            child: tabBarViewList()[index],
          ),
        ),
      ),
    );
  }

  ///탭바뷰 List
  List<Widget> tabBarViewList() {
    List<Widget> itemList = [];
    itemList.add(gridViewWidget());
    itemList.add(gridViewWidget());
    itemList.add(gridViewWidget());
    itemList.add(gridViewWidget());
    return itemList;
  }

  ///탭바
  SliverPersistentHeader tabBar() {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: MyCustomHeader(CommonTabBar(tabLabelList).create()),
    );
  }

  Widget gridViewWidget() {
    return Container(
      child: GridView.count(
        padding: EdgeInsets.all(0),
        childAspectRatio: 0.7,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          ///여기에 필요한 데이터 widget 만들어서 넣을것
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: gridViewItem(),
          );
        }),
      ),
    );
  }

  Widget gridViewItem() {
    return Center(
      child: Column(
        children: [
          fadeImageWidget(listImageUrl),
          SizedBox(
            height: 5,
          ),
          Text("후코홀릭 제품")
        ],
      ),
    );
  }

  Widget fadeImageWidget(String url) {
    print("urlurlurlurl $url");
    return Image.network(url);
    // return FadeInImage.memoryNetwork(
    //     placeholder: kTransparentImage, image: url);
  }
}
