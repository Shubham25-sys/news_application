import 'package:flutter/material.dart';
import 'package:news_application/presentation/widgets/common_widgets/frosted_glass.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../resources/assets_const.dart';
import '../../resources/color_const.dart';
import '../../resources/theme_const.dart';
import '../../resources/value_const.dart';

class InformationScreen extends StatefulWidget {
  final String title;
  final String description;
  final String Content;
  final String Image;
  final String authorname;
  const InformationScreen({super.key, required this.title, required this.description, required this.Content, required this.Image, required this.authorname});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
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
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Image(
            image: const AssetImage(ImageAssets.arrow_left),
            height: 25,
            color: darkModeProvider.isDarkMode
                ? ColorManager.white
                : ColorManager.black,
          ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height / 2,
                  width: screenSize.width / 1,
                  child:  widget.Image.toString() == "null" ? const Image(image: AssetImage(ImageAssets.defaultimage,),fit: BoxFit.fill):Image(
                    image: NetworkImage(widget.Image.toString()),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'Description',
                  style: UpdateStyle.CustomeTextStyle(screenSize.width / 20,
                      FontWeightManager.medium, darkModeProvider.isDarkMode ? ColorManager.white:ColorManager.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: screenSize.width / 1,
                  child: Text(widget.description.toString() == "null"?'No Data':
                    widget.description,
                    style: UpdateStyle.CustomeTextStyle(screenSize.width / 25,
                        FontWeightManager.medium, darkModeProvider.isDarkMode ? ColorManager.white:ColorManager.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Content',
                  style: UpdateStyle.CustomeTextStyle(screenSize.width / 20,
                      FontWeightManager.medium, darkModeProvider.isDarkMode ? ColorManager.white:ColorManager.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: screenSize.width / 1,
                  child: Text(widget.Content.toString() == "null" ? 'No Data':
                   widget.Content,
                    style: UpdateStyle.CustomeTextStyle(screenSize.width / 25,
                        FontWeightManager.medium, darkModeProvider.isDarkMode ? ColorManager.white:ColorManager.black),
                  ),
                ),
              ],
            ),
            Positioned(
              left: screenSize.width / 30,
              top: screenSize.height / 2.5,
              child: FrostedGlassBox(
                height: screenSize.height / 5,
                width: screenSize.width / 1.1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.authorname == 'null' ? 'No Author' : widget.authorname,
                          style: UpdateStyle.CustomeTextStyle(
                              screenSize.width / 20,
                              FontWeightManager.medium,
                              ColorManager.black)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.title,
                        style: UpdateStyle.CustomeTextStyle(
                            screenSize.width / 25,
                            FontWeightManager.semiBold,
                            ColorManager.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
