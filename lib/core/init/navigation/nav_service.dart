import 'package:flu_template_s0e4/core/init/navigation/INavService.dart';
import 'package:flutter/cupertino.dart';

class NavigationServ implements INavService{
    static NavigationServ _instance=NavigationServ._init();
    static NavigationServ get instance=>_instance;
    NavigationServ._init();//dışarıya kapattık sadece bu sınıfa özel

    GlobalKey<NavigatorState>navigatorKey=GlobalKey();
    final removeAllOldRoutes=(Route<dynamic> route)=>false;
    @override
    Future<void> navToPage({String path,Object data}) async{
      await navigatorKey.currentState.pushNamed(path,arguments:data); //yönlendirmeler
    }

  @override
  Future<void> navToPageClear({String path, Object data}) async {
      await navigatorKey.currentState.pushNamedAndRemoveUntil(path,removeAllOldRoutes,arguments:data); //kendisine kadar olan tüm pageleri siler.

  }
}