import 'package:equatable/equatable.dart';
import 'package:news_application/models/news_heading_model.dart';

import '../models/news_business_model.dart';
import '../models/news_entertainment_model.dart';
import '../models/news_health_model.dart';
import '../models/news_political_model.dart';
import '../models/news_sports_model.dart';
import '../models/news_tech_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final NewsModels newsModel;
  final Politicalnews politicalnews;
  final Businessnews businessnews;
  final Helthnews helthnews;
  final Sportsnews sportsnews;
  final Technews technews;
  final Entertainmentnews entertainmentnews;

  NewsLoadedState({
    required this.businessnews,
    required this.helthnews,
    required this.sportsnews,
    required this.technews,
    required this.entertainmentnews,
    required this.newsModel,
    required this.politicalnews,
  });
  @override
  List<NewsModels> get props => [newsModel];
  List<Politicalnews> get props1 => [politicalnews];
  List<Businessnews> get props2 => [businessnews];
  List<Helthnews> get props3 => [helthnews];
  List<Sportsnews> get props4 => [sportsnews];
  List<Technews> get props5 => [technews];
  List<Entertainmentnews> get props6 => [entertainmentnews];
}

class NewsErrorState extends NewsState {
  final String errorMessage;

  NewsErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
  List<Object> get props1 => [errorMessage];
  List<Object> get props2 => [errorMessage];
  List<Object> get props3 => [errorMessage];
  List<Object> get props4 => [errorMessage];
  List<Object> get props5 => [errorMessage];
  List<Object> get props6 => [errorMessage];
}
