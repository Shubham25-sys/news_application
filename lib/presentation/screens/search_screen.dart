import 'package:flutter/material.dart';
import 'package:news_application/presentation/widgets/common_widgets/main_data.dart';
import 'package:news_application/presentation/widgets/pageview_widgets/headline.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../resources/assets_const.dart';
import '../../resources/color_const.dart';
import '../../resources/theme_const.dart';
import '../../resources/value_const.dart';
import '../widgets/common_widgets/appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> items = ['Sports','Headline','Plitics','Business','Helth','Technology'];
  TextEditingController _searchController = TextEditingController();
  ScrollController scrollcontroller = ScrollController();
  //var bottomnavbar = new Bottom();
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
      //bottomNavigationBar:darkModeProvider.isDarkMode ? bottomnavbar.bottomappbarDark : bottomnavbar.bottomappbarLight,
      body: SingleChildScrollView(
        controller: scrollcontroller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                cursorColor: darkModeProvider.isDarkMode
                    ? ColorManager.white
                    : ColorManager.black,
                style: TextStyle(
                    color: darkModeProvider.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: darkModeProvider.isDarkMode
                        ? ColorManager.darkbottom
                        : ColorManager.white,
                    hintText: 'Search Tags',
                    hintStyle: TextStyle(
                        color: darkModeProvider.isDarkMode
                            ? ColorManager.white
                            : ColorManager.black),
                    prefixIcon: Icon(
                      Icons.search,
                      color: darkModeProvider.isDarkMode
                          ? ColorManager.white
                          : ColorManager.black,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.black),
                        borderRadius: BorderRadius.circular(10))),
                onChanged: (value) {
                  // Implement your search logic here
                  // You can filter the results based on the entered text
                  // For example, update a list of items displayed in the UI
                  // based on the search term.
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Popular Tags',
                style: UpdateStyle.CustomeTextStyle(
                    screenSize.width / 15,
                    FontWeightManager.medium,
                    darkModeProvider.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black),
              ),
            ),
            SizedBox(
              height: screenSize.height/20,
              width: screenSize.width/1,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:items.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    //borderRadius: BorderRadius.circular(20),
                    child: Text(items[index],style: UpdateStyle.CustomeTextStyle(15, FontWeightManager.regular, darkModeProvider.isDarkMode ? ColorManager.white : ColorManager.black),),
                  ),
                );
              }),
            ),
            Align(alignment:Alignment.centerRight,child: TextButton(onPressed: (){}, child: const Text('View all..'))),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest News',
                    style: UpdateStyle.CustomeTextStyle(
                        screenSize.width / 15,
                        FontWeightManager.medium,
                        darkModeProvider.isDarkMode
                            ? ColorManager.white
                            : ColorManager.black),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const HeadlinePage()));
                      });
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: darkModeProvider.isDarkMode ? ColorManager.darkbottom : ColorManager.bookmarkbglight,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: ColorManager.white,
                          child: Center(child: Image(image: const AssetImage(ImageAssets.small_arrow),color: ColorManager.black,),))
                    ),
                  ),
                ],
              ),
            ),
            MainNewsData(controller: scrollcontroller,),
          ],
        ),
      ),
    );
  }
}
