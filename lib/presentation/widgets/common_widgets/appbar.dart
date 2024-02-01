import 'package:flutter/material.dart';

import '../../../resources/color_const.dart';

class Bottom{
  Widget get bottomappbarDark{
    return BottomNavigationBar(
      backgroundColor: ColorManager.darkbottom,
      onTap: (index){
        print(index);
      },
      items: [

        BottomNavigationBarItem(label: '',icon: Icon(Icons.home,color: ColorManager.white,)),
        BottomNavigationBarItem(label: '',icon: Icon(Icons.search,color: ColorManager.white),),
        BottomNavigationBarItem(label: '',icon: Icon(Icons.bookmark_border_sharp,color: ColorManager.white),)

      ],);
  }
  Widget get bottomappbarLight{
    return BottomNavigationBar(
      backgroundColor: ColorManager.white,
      onTap: (index){
        print(index);
      },
      items: [

        BottomNavigationBarItem(label: '',icon: Icon(Icons.home,color: ColorManager.black,)),
        BottomNavigationBarItem(label: '',icon: Icon(Icons.search,color: ColorManager.black),),
        BottomNavigationBarItem(label: '',icon: Icon(Icons.bookmark_border_sharp,color: ColorManager.black),)

      ],);
  }
}