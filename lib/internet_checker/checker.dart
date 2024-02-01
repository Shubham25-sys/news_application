// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// class EnternetChecker {
//   BuildContext? context;
//
//   void init(BuildContext context) {
//     this.context = context;
//   }
//
//   void showMyDialog(String message) {
//     if (context == null) {
//       throw Exception("BuildContext is not initialized");
//     }
//     late StreamSubscription subscription;
//     var isDeviceConnected = false;
//     bool isAlertSet = false;
//
//     void getConnectivity() =>
//         subscription = Connectivity().onConnectivityChanged.listen((
//             ConnectivityResult result) async {
//           isDeviceConnected = await InternetConnectionChecker().hasConnection;
//           if (!isDeviceConnected && isAlertSet == false) {
//             showDialogBox;
//             isAlertSet = true;
//           }
//         });
//
//     showDialogBox() {
//       showDialog(
//         context: context!,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('No Connection'),
//             content: const Text("Please check your internet connectivity"),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }