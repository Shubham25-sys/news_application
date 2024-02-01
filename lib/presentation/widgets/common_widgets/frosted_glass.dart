import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_application/resources/color_const.dart';

class FrostedGlassBox extends StatelessWidget {
   FrostedGlassBox({super.key, this.width, this.height, this.child});

  final width;
  final height;
  final child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
                filter: ImageFilter.blur(
                 sigmaX: 4.0,
                    sigmaY: 4.0
                ),
            child: Container(),),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              border: Border.all(width:2,color: ColorManager.black.withOpacity(0.13)),
              gradient:LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                ColorManager.white.withOpacity(0.1),
                ColorManager.white.withOpacity(0.5),
              ]) ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
