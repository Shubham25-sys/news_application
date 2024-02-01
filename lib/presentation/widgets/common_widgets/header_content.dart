import 'package:flutter/material.dart';
import 'package:news_application/constant/list.dart';

import '../../../resources/color_const.dart';
import '../../../resources/theme_const.dart';
import '../../../resources/value_const.dart';

class HeaderContaint extends StatefulWidget {
  const HeaderContaint({
    super.key,
  });

  @override
  State<HeaderContaint> createState() => _HeaderContaintState();
}

class _HeaderContaintState extends State<HeaderContaint> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent = _scrollController.position.minScrollExtent;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      
      animatedToMaxMin(maxScrollExtent, minScrollExtent, maxScrollExtent, 50, _scrollController);
    });
  }
  animatedToMaxMin(double max,double min, double direction,int seconds, ScrollController scrollController){
    scrollController.animateTo(direction, duration: Duration(seconds: seconds), curve: Curves.linear).then((value){
      direction = direction == max ? min : max;
      //animatedToMaxMin(max, min, direction, seconds, scrollController);
    });
  }
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height / 6,
        width: screenSize.width,
        child: ListView.builder(
          controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(children: [
                  GestureDetector(
                    onTap: (){
                setState(() {
                  Navigator.pushNamed(context, '/screen$index');
                });
              },
                    child: SizedBox(
                      height: screenSize.height / 6,
                      width: screenSize.width / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(imageitems[index]),
                          colorBlendMode: BlendMode.modulate,
                          width: 100,
                          fit: BoxFit.fill,
                          opacity: AlwaysStoppedAnimation(0.7),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          items[index],
                          style: UpdateStyle.CustomeTextStyle(
                              screenSize.width / 20,
                              FontWeightManager.semiBold,
                              ColorManager.white),
                        )),
                  ),
                ]),
              );
            }));
  }
}
