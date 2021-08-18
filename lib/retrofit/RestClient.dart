import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "https://hacker-news.firebaseio.com/v0")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/topstories.json')
  Future<List<int>> getTopNews();

  @GET("/item/{id}.json")
  Future<News> getNewDetail(@Path("id") int id);
}

@JsonSerializable()
class News {
  int id;
  String title;
  String url;

  News({this.id = 0, this.title = "", this.url = ""});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  // factory News.fromJson(Map<String, dynamic>) => _$NewsFromJson(json);
  //
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
