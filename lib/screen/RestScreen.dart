import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_exam/retrofit/RestClient.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({Key? key}) : super(key: key);

  @override
  _RestScreenState createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  late RestClient restClient;

  @override
  void initState() {
    super.initState();

    Dio dio = Dio();
    restClient = RestClient(dio);

    Future.microtask(() async {
      final resp = await restClient.getTopNews();
      // print("뉴스 리스트 : $resp");
    });
  }

  renderNewsCard({required News news}) {
    return Card(
      child: Column(
        children: [
          Text(news.id.toString()),
          Text(news.title.toString()),
          Text(news.url.toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrofit"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: restClient.getTopNews(),
          initialData: [],
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final ids = snapshot.data;
              return ListView.builder(
                  itemCount: ids.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: (){
                        print("아이템 클릭 : $index");
                      },
                      child: FutureBuilder(
                        future: restClient.getNewDetail(ids[index]),
                        builder: (context, AsyncSnapshot snapshot) {
                          // print(
                          //     "테스트 FutureBuilder 진입 222 : ${snapshot.connectionState}");
                          // print(
                          //     "테스트 : id : ${ids[index]}, url : ${restClient.getNewDetail(ids[index])}");
                          if (snapshot.data != null) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            // print("테스트 news : ${snapshot.data}");
                            return renderNewsCard(news: snapshot.data);
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
