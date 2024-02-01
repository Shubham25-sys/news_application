import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_application/bloc/news_event.dart';
import 'package:news_application/presentation/screens/info_screen.dart';
import 'package:news_application/resources/assets_const.dart';
import 'package:provider/provider.dart';

import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_state.dart';
import '../../../provider/provider.dart';
import '../../../resources/color_const.dart';
import '../../../resources/theme_const.dart';
import '../../../resources/value_const.dart';
import '../dark_mode_theme/bottom_bar_dark.dart';
import '../light_mode_theme/bottom_bar_light.dart';
import 'header_content.dart';

class MainNewsData extends StatefulWidget {
  final ScrollController controller;
  const MainNewsData({super.key, required this.controller});

  @override
  State<MainNewsData> createState() => _MainNewsDataState();
}

class _MainNewsDataState extends State<MainNewsData> {
  Future<void> _refresh()async {
    Future.delayed(const Duration(seconds: 2));
    context.read<NewsBloc>().add(NewsLoadedEvent());
  }
  @override
  void initState() {
   context.read<NewsBloc>().add(NewsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyProvider darkModeProvider = Provider.of<MyProvider>(context);
    final provider = Provider.of<MyProvider>(context);
    List<String> templist =[];
    final screenSize = MediaQuery.of(context).size;
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, state) {
        if (state is NewsLoadingState) {
          return  Center(
            child: Align(alignment:Alignment.center,child: SpinKitFadingCircle(color: ColorManager.red)),
          );
        } else if (state is NewsLoadedState) {
          return RefreshIndicator(
            color: ColorManager.red,
            onRefresh: _refresh,
            child: SizedBox(
            height: screenSize.height/1.5,
            width: screenSize.width,
            child: ListView.builder(
              controller: widget.controller,
                //physics: NeverScrollableScrollPhysics(),
                itemCount: state.newsModel.articles!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>InformationScreen(
                              title: state.newsModel.articles![index].title.toString(),
                              description: state.newsModel.articles![index].description.toString(),
                              Content:state.newsModel.articles![index].content.toString() ,
                              Image: state.newsModel.articles![index].urlToImage!,
                              authorname: state.newsModel.articles![index].author.toString(),)));
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: state.newsModel.articles![index].urlToImage == null ? const Image(image: AssetImage(ImageAssets.defaultimage,),fit: BoxFit.fill) :
                                Image(
                                  image:
                                      NetworkImage(state.newsModel.articles![index].urlToImage.toString()),
                                  fit: BoxFit.fill,
                                )
                              ),
                              SizedBox(
                                  height: screenSize.height / 10,
                                  width: screenSize.width,
                                  child: Text(
                                    state.newsModel.articles![index].title.toString(),
                                    style: UpdateStyle.CustomeTextStyle(
                                        screenSize.width / 20,
                                        FontWeightManager.regular,
                                        darkModeProvider.isDarkMode
                                            ? ColorManager.white
                                            : ColorManager.black),
                                  )),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.newsModel.articles![index].publishedAt!.toUtc().toString(),
                                      style: UpdateStyle.CustomeTextStyle(
                                          screenSize.width / 25,
                                          FontWeightManager.regular,
                                          ColorManager.gray)),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: darkModeProvider.isDarkMode ? ColorManager.bookmarkbgdark : ColorManager.bookmarkbglight,
                                    child:IconButton(onPressed: () {
                                      setState(() {
                                        if(templist.contains(state.newsModel.articles![index].title.toString())&& templist.contains(state.newsModel.articles![index].urlToImage.toString())){
                                          templist.remove(state.newsModel.articles![index].title.toString());
                                          templist.remove(state.newsModel.articles![index].urlToImage.toString());
                                        }else{
                                          templist.add(state.newsModel.articles![index].title.toString());
                                          templist.add(state.newsModel.articles![index].urlToImage.toString());
                                          print('saved');
                                        }
                                        print('Tapped');

                                        provider.selectedItems(state.newsModel.articles![index].title.toString(),state.newsModel.articles![index].urlToImage.toString());
                                      });
                                    }, icon:Image(image:provider.isExist(state.newsModel.articles![index].title.toString()) ?  AssetImage(ImageAssets.bookmark_fill) : AssetImage(ImageAssets.bookmark_out),height:20,color: darkModeProvider.isDarkMode ? ColorManager.white : ColorManager.gray,))
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
          );
        } else if (state is NewsErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return const SizedBox();
      },
    );
  }
}
