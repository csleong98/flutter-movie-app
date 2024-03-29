import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  Future<bool> saveDarkThemValue(bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool('isDark', value);
  }

  Future<dynamic> getDarkPref() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.get('isDark');
  }

}