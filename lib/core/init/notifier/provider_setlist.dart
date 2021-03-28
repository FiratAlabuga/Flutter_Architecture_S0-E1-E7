import 'dart:js';

import 'package:flu_template_s0e4/core/init/navigation/nav_service.dart';
import 'package:flu_template_s0e4/core/init/notifier/theme_notifier.dart';
import 'package:flu_template_s0e4/core/init/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider extends AppTheme{
    static AppProvider _instance;
    static AppProvider get instance {
      if (_instance == null) _instance=AppProvider._init();
      return _instance;
    }
    AppProvider._init();//dışarıya kapattık sadece bu sınıfa özel
    List<SingleChildWidget> dependItems=[
      ChangeNotifierProvider(create: (context)=>ThemeNotifier(),),
      Provider.value(value: NavigationServ.instance)
    ];
    List<SingleChildWidget> uiChangedItems=[];//mobx ile daha iyi
    List<SingleChildWidget> singleItems=[];
}