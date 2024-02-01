import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../provider/provider.dart';
import '../../../resources/color_const.dart';

class Skelton extends StatelessWidget {
  const Skelton({super.key});


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    MyProvider darkModeProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: ColorManager.shimmerbg,
          highlightColor: ColorManager.white,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenSize.height/5,
                    width: screenSize.width/1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:ColorManager.shimmerbg),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: screenSize.height/35,
                    width: screenSize.width/2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:ColorManager.shimmerbg,
                    ),),
                  SizedBox(height: 15,),
                  Container(
                    height: screenSize.height/40,
                    width: screenSize.width/1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:ColorManager.shimmerbg),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: screenSize.height/40,
                    width: screenSize.width/4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:ColorManager.shimmerbg),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 50),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
