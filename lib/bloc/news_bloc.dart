import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import '../models/news_heading_model.dart';
import '../repo/news_repo.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsLoadedEvent, NewsState> {
  final NewsRepo newsRepo;
  NewsBloc(this.newsRepo) : super(NewsLoadingState()) {
    on<NewsLoadedEvent>((event, emit) async {
      try {
        emit(NewsLoadingState());
        var data = await newsRepo.getNews();
        var politicaldata = await newsRepo.getpoliticalNews();
        var businessdata = await newsRepo.getbusinessNews();
        var sportsdata = await newsRepo.getsportslNews();
        var helthdata = await newsRepo.gethelthNews();
        var technologydata = await newsRepo.gettechNews();
        var entertainmentdata = await newsRepo.getentertainmentNews();
        emit(NewsLoadedState(
          newsModel: data,
          politicalnews: politicaldata,
          businessnews: businessdata,
          helthnews: helthdata,
          sportsnews: sportsdata,
          technews: technologydata,
          entertainmentnews: entertainmentdata,
        ));
      } catch (e) {
        emit(NewsErrorState(errorMessage: e.toString()));
      }
    });
  }
}
