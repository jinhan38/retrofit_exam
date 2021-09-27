import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EventType_A extends StatelessWidget {

  String listImageUrl = "https://pood-bucket.s3.ap-northeast-2.amazonaws.com/product/20210524184906049-4f6d8315-4524-404a-8d0b-b86c2f3c6191.jpeg";
  String detailImageUrl = "https://pood-bucket.s3.ap-northeast-2.amazonaws.com/product/20210513151308013-65605d21-103b-4d99-a7a0-d4c46a6f3c8f.jpeg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("이벤트 타입 A"),
        ),
        body: body());
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text("이벤트 타입 A 타이틀", style: TextStyle(fontSize: 30),),
          SizedBox(height: 20),
          Text("2021.11.11 ~ 2021.12.12"),
          SizedBox(height: 20),
          fadeImageWidget(detailImageUrl),
          SizedBox(height: 20),
          Container(
            child: GridView.count(
              padding: EdgeInsets.all(0),
              childAspectRatio: 0.7,
              shrinkWrap: true,

              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children:
              List.generate(10, (index) {
                ///여기에 필요한 데이터 widget 만들어서 넣을것
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: gridViewItem(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget gridViewItem() {
    return Center(
      child: Column(
        children: [

          fadeImageWidget(listImageUrl),
          SizedBox(height: 5,),
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
