import 'package:flutter/material.dart';
import 'package:news_application/resources/assets_const.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../resources/color_const.dart';
import '../../resources/theme_const.dart';
import '../../resources/value_const.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final darkModeProvider = Provider.of<MyProvider>(context);
    final provider = Provider.of<MyProvider>(context);
    final title = provider.getnewstitle;
    final image = provider.getnewsimage;
    return Scaffold(
      backgroundColor:
          darkModeProvider.isDarkMode ? ColorManager.black : ColorManager.white,
      appBar: AppBar(
        backgroundColor: darkModeProvider.isDarkMode
            ? ColorManager.black
            : ColorManager.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              const Drawer();
            });
          },
          icon: Image(image: const AssetImage(ImageAssets.menu),height:25,color: darkModeProvider.isDarkMode ? ColorManager.white: ColorManager.black,),
        ),
        actions: [
          IconButton(
              onPressed: () {
                darkModeProvider.toggleDarkMode();
              },
              icon: Icon(
                darkModeProvider.isDarkMode
                    ? Icons.nights_stay_sharp
                    : Icons.sunny,
                color: darkModeProvider.isDarkMode
                    ? ColorManager.white
                    : ColorManager.sunny,
              ))
        ],
        title: Center(
            child: Text(
          'INDIA NEWS',
          style: UpdateStyle.CustomeTextStyle(
              36, FontWeightManager.semiBold, ColorManager.red),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Bookmarked',
                    style: UpdateStyle.CustomeTextStyle(
                        screenSize.width / 20,
                        FontWeightManager.semiBold,
                        darkModeProvider.isDarkMode
                            ? ColorManager.white
                            : ColorManager.black),
                  ),
                  const SizedBox(width: 25,),
                  Image(image: const AssetImage(ImageAssets.bookmark_fill),height: 30,color: darkModeProvider.isDarkMode ? ColorManager.white : ColorManager.black,),
                ],
              ),
            SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: title.isEmpty ?  Center(child: Text('No Data Found!',style: TextStyle(color: ColorManager.gray),),)
                  :ListView.builder(
                  //controller: _controller,
                  //physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: image[index].toString() == 'null' ? const Image(image: AssetImage(ImageAssets.defaultimage,),fit: BoxFit.fill) :Image(
                                  image:
                                  NetworkImage(image[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                  height: screenSize.height / 10,
                                  width: screenSize.width,
                                  child: Text(
                                    title[index].toString(),
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
                                MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: darkModeProvider.isDarkMode ? ColorManager.bookmarkbgdark : ColorManager.bookmarkbglight,
                                    child: IconButton(onPressed: () {
                                      setState(()=>provider.selectedItems(title[index], image[index]));
                                    }, icon: Image(image: AssetImage(ImageAssets.delete),color: darkModeProvider.isDarkMode ? ColorManager.gray : ColorManager.black)
                                  ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
