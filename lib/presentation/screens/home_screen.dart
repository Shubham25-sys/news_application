import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/bloc/news_bloc.dart';
import 'package:news_application/bloc/news_state.dart';
import 'package:news_application/presentation/widgets/common_widgets/main_data.dart';
import 'package:news_application/presentation/widgets/dark_mode_theme/bottom_bar_dark.dart';
import 'package:news_application/presentation/widgets/light_mode_theme/bottom_bar_light.dart';
import 'package:news_application/resources/assets_const.dart';
import 'package:news_application/resources/theme_const.dart';
import 'package:news_application/resources/value_const.dart';
import 'package:provider/provider.dart';

import '../../constant/list.dart';
import '../../provider/provider.dart';
import '../../resources/color_const.dart';
import '../widgets/common_widgets/appbar.dart';
import '../widgets/common_widgets/header_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //var bottomnavbar = new Bottom();
  ScrollController scrollcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    MyProvider darkModeProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor:
          darkModeProvider.isDarkMode ? ColorManager.black : ColorManager.white,
      appBar: AppBar(
        backgroundColor: darkModeProvider.isDarkMode
            ? ColorManager.black
            : ColorManager.white,
        elevation: 0,
        leading: IconButton( onPressed: () {
          setState(() {
             Drawer();
          });

        }, icon:  Image(image: AssetImage(ImageAssets.menu),height:25,color: darkModeProvider.isDarkMode ? ColorManager.white: ColorManager.black,),),
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
     // bottomNavigationBar:darkModeProvider.isDarkMode ? bottomnavbar.bottomappbarDark : bottomnavbar.bottomappbarLight,
      // drawer: Drawer(),
      body: SingleChildScrollView(
        controller: scrollcontroller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderContaint(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Top News',
                style: UpdateStyle.CustomeTextStyle(
                    screenSize.width / 15,
                    FontWeightManager.bold,
                    darkModeProvider.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black),
              ),
            ),
             MainNewsData(controller: scrollcontroller,),
            //Align(alignment:Alignment.bottomCenter,child: )
          ],
        ),
      )
       
      
    );
  }
}

// const MainNewsData(),
// darkModeProvider.isDarkMode ? const DarkBottomBar() : const LightBottomBar()