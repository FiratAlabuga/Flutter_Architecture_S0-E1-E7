//provider 
import 'package:flu_template_s0e4/core/constant/enum/app_theme_enum.dart';
import 'package:flu_template_s0e4/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';
//cn içerisinde kendi stateini tutar.
//setState ihtiyaç duymaz onun yerine notifylisterer ile dinler.
class ThemeNotifier extends ChangeNotifier{
  ThemeData _currentTheme=AppThemeLight.instance.themeData;
  ThemeData get currentTheme=> AppThemeLight.instance.themeData;
  void changeVal(AppThemes themes){
    if(themes==AppThemes.LIGHT){
      _currentTheme=ThemeData.light();
    }else{
      _currentTheme=ThemeData.dark();
    }
    notifyListeners();
  }
}