import 'package:http/http.dart' as http;
import 'package:news_application/models/news_business_model.dart';
import 'package:news_application/models/news_entertainment_model.dart';
import 'package:news_application/models/news_health_model.dart';
import 'package:news_application/models/news_sports_model.dart';
import 'package:news_application/models/news_tech_model.dart';
import '../models/news_heading_model.dart';
import '../models/news_political_model.dart';
class NewsRepo{
  final String apiKey = 'a767837b4e774fd49fa495992f8fd3e6';
 Future<NewsModels> getNews() async {
    var response =  await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=${apiKey}'));
    if(response.statusCode == 200){
      return newsFromJson(response.body);
    }else{
      throw Exception();
    }
  }
  Future<Politicalnews> getpoliticalNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=${apiKey}'));
    if (response.statusCode == 200) {
      return politicalnewsFromJson(response.body);
    } else {
      throw Exception();
    }
  }
  Future<Businessnews> getbusinessNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=${apiKey}'));
    if (response.statusCode == 200) {
      return businessnewsFromJson(response.body);
    } else {
      throw Exception();
    }
  }
  Future<Helthnews> gethelthNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=${apiKey}'));
    if (response.statusCode == 200) {
      return helthnewsFromJson(response.body);
    } else {
      throw Exception();
    }
  }
  Future<Technews> gettechNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=${apiKey}'));
    if (response.statusCode == 200) {
      return technewsFromJson(response.body);
    } else {
      throw Exception();
    }
  }
  Future<Sportsnews> getsportslNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=${apiKey}'));
    if (response.statusCode == 200) {
      return sportsnewsFromJson(response.body);
    } else {
      throw Exception();
    }
  }
  Future<Entertainmentnews> getentertainmentNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=${apiKey}'));
    if (response.statusCode == 200) {
      return entertainmentnewsFromJson(response.body);
    } else {
      throw Exception();
    }
  }

}