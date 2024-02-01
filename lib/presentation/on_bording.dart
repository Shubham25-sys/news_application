import 'package:flutter/material.dart';
import 'package:news_application/presentation/screens/home_screen.dart';
import 'package:news_application/presentation/screens/search_screen.dart';
import 'package:news_application/resources/assets_const.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../resources/color_const.dart';
import 'screens/bookmark_screen.dart';


class OnBordingScreen extends StatefulWidget {
  OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    MyProvider darkModeProvider = Provider.of<MyProvider>(context);
    final screen = [
      HomeScreen(),
      SearchScreen(),
      BookMarkScreen()
    ];
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: darkModeProvider.isDarkMode ? bottomappbarDark : bottomappbarLight,
    );
  }

  Widget get bottomappbarDark{
    return BottomNavigationBar(
      backgroundColor: ColorManager.darkbottom,
      onTap: (Index) => setState(() => index = Index),
      items: [

        BottomNavigationBarItem(label:"",icon: Image(image: index == 0 ? AssetImage(ImageAssets.home_fill):AssetImage(ImageAssets.home,),color: ColorManager.white,
          height: 25,)),
        BottomNavigationBarItem(label:"",icon: Image(image: index == 1 ? AssetImage(ImageAssets.find_fill):AssetImage(ImageAssets.find,),color: ColorManager.white,
          height: 25,)),
        BottomNavigationBarItem(label:"",icon: Image(image: index == 2 ? AssetImage(ImageAssets.bookmark_fill):AssetImage(ImageAssets.bookmark_out,),color: ColorManager.white,
          height: 25,))

      ],);
  }
  Widget get bottomappbarLight{
    return BottomNavigationBar(
      backgroundColor: ColorManager.white,
      onTap: (Index) => setState(() => index = Index),
      items: [

        BottomNavigationBarItem(label: '',icon: Image(image: index == 0 ? AssetImage(ImageAssets.home_fill): AssetImage(ImageAssets.home,),color: ColorManager.black,
          height: 25,)),
        BottomNavigationBarItem(label: '',icon: Image(image: index == 1 ? AssetImage(ImageAssets.find_fill): AssetImage(ImageAssets.find,),color: ColorManager.black,
          height: 25,)),
        BottomNavigationBarItem(label: '',icon: Image(image: index == 2 ? AssetImage(ImageAssets.bookmark_fill):AssetImage(ImageAssets.bookmark_out,),color: ColorManager.black,
          height: 25,))

      ],);
  }
}
