import 'package:flu_template_s0e4/core/constant/enum/local_keys_enum.dart';
import 'package:flu_template_s0e4/core/init/lang/locale_keys.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static LocaleManager _instance = LocaleManager._init();
  SharedPreferences _preferences;
  static LocaleManager get instance {
    if (_instance == null) _instance = LocaleManager._init();
    return _instance;
  }

  LocaleManager._init(){
    SharedPreferences.getInstance().then((value){
      _preferences = value;
    });
  }
  static preferencesInit()async{
    if (instance._preferences==null){
      instance._preferences=await SharedPreferences.getInstance();
    }
    return;
  }
  Future<void> setStringValue(LocaleSharedPrefKeys key,String value) async {
    await _preferences.setString(key.toString(),value);
    
  }
  String getStringValue(LocaleSharedPrefKeys key)=>_preferences.getString(key.toString() ?? " ");
  //init dolmasını beklemeek için get ile alıyoruz. SP
}
