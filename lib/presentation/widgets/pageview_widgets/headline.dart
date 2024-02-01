import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_application/resources/assets_const.dart';
import 'package:provider/provider.dart';

import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_event.dart';
import '../../../bloc/news_state.dart';
import '../../../provider/provider.dart';
import '../../../resources/color_const.dart';
import '../../../resources/theme_const.dart';
import '../../../resources/value_const.dart';
import '../../screens/info_screen.dart';

class HeadlinePage extends StatefulWidget {
  const HeadlinePage({super.key});

  @override
  State<HeadlinePage> createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
  Future<void> _refresh()async {
    Future.delayed(const Duration(seconds: 2));
    context.read<NewsBloc>().add(NewsLoadedEvent());
  }
  @override
  void initState() {
    context.read<NewsBloc>().add(NewsLoadedEvent());
    super.initState();
  }
  ScrollController scrollcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    MyProvider darkModeProvider = Provider.of<MyProvider>(context);
    final provider = Provider.of<MyProvider>(context);
    List<String> templist =[];
    return  Scaffold(
      backgroundColor:
      darkModeProvider.isDarkMode ? ColorManager.black : ColorManager.white,
      appBar: AppBar(
        backgroundColor: darkModeProvider.isDarkMode
            ? ColorManager.black
            : ColorManager.white,
        elevation: 0,
        leading: IconButton(onPressed: () {
          setState(() {
            Navigator.pop(context);
          });

        }, icon: Image(image: const AssetImage(ImageAssets.arrow_left),height:25,color: darkModeProvider.isDarkMode ? ColorManager.white: ColorManager.black,),),
        actions: [
          IconButton(
              onPressed: () {
                darkModeProvider.toggleDarkMode();
              },
              icon: Icon(darkModeProvider.isDarkMode ? Icons.nights_stay_sharp:Icons.sunny,color: darkModeProvider.isDarkMode ? ColorManager.white:ColorManager.sunny,))
        ],
        title: Center(
            child: Text(
              'INDIA NEWS',
              style: UpdateStyle.CustomeTextStyle(
                  36, FontWeightManager.semiBold, ColorManager.red),
            )),
      ),
      body: SingleChildScrollView(
        controller: scrollcontroller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //HeaderContaint(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Headlines',
                style: UpdateStyle.CustomeTextStyle(
                    screenSize.width / 15,
                    FontWeightManager.bold,
                    darkModeProvider.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black),
              ),
            ),

            BlocBuilder<NewsBloc, NewsState>(
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
                      height: screenSize.height/1,
                      width: screenSize.width,
                      child: ListView.builder(
                        controller: scrollcontroller,
                         // physics: const NeverScrollableScrollPhysics(),
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
                                              child: IconButton(onPressed: () {
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
            ),
            //Align(alignment:Alignment.bottomCenter,child: )
          ],
        ),
      ),
    );
  }
}
