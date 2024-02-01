import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_application/internet_checker/checker.dart';
import 'package:news_application/presentation/on_bording.dart';
import 'package:news_application/resources/assets_const.dart';

import '../../resources/color_const.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    getConnectivity();
    // Add any initialization logic here
    Future.delayed(const Duration(seconds: 3), () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnBordingScreen()),
    ));
    //navigateToNextScreen();
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen((
          ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox;
          setState(()=>isAlertSet = true);

        }
      });
  showDialogBox() => showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('No Connection'),
        content: const Text("Please check your internet connectivity"),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              setState(()=>isAlertSet = false);
              isDeviceConnected = await InternetConnectionChecker().hasConnection;
              if(!isDeviceConnected){
                showDialogBox();
              }
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your splash screen content (e.g., logo)
            SizedBox(
                height: screenSize.height / 2,
                width: screenSize.width / 1.5,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage(ImageAssets.Branding)),
                    LinearProgressIndicator(color: ColorManager.red,),
                  ],
                )),
            // SizedBox(
            //   width: screenSize.width/2,
            //   child:
            // )
          ],
        ),
      ),
    );
  }
}
