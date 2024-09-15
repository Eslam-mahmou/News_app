import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier{
  Locale locale=const Locale("en");
  void changeLanguage(String language){
    locale=Locale(language);
    saveLanguage(language);
    notifyListeners();
  }
Future<void> saveLanguage(String language)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("language_code", language);
}
Future<void> getLanguage()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 String language= prefs.getString("language_code")??"en";
locale= Locale(language);
  notifyListeners();
}

}