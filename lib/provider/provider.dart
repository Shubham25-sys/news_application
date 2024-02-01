import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  bool _isDarkMode = false;
  List<String> _title = [];
  List<String> _image = [];
  List<String> get getnewstitle => _title;
  List<String> get getnewsimage => _image;

  bool get isDarkMode => _isDarkMode;


  void selectedItems(String title,String image){
    final isExist = _title.contains(title);
    final isExistcost = _image.contains(image);

    if(isExist && isExistcost){
      _title.remove(title);
      _image.remove(image);
    }else{
      _title.add(title);
      _image.add(image);
    }
    notifyListeners();
  }
  bool isExist(String title){
    final isExist = _title.contains(title);
    return isExist;
  }
  void clearAll(){
    _title = [];
    _image = [];
    notifyListeners();
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}