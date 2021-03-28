
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/auth/test/view/test_view.dart';
import '../../components/widget/not_found.dart';
import '../../constant/navigation/nav_constant.dart';

class NavigationRoute{
    static NavigationRoute _instance=NavigationRoute._init();
    static NavigationRoute get instance=>_instance;
    NavigationRoute._init();//dışarıya kapattık sadece bu sınıfa özel-singleton
    Route<dynamic> genRoute(RouteSettings args){
      switch (args.name) {
        case NavConstant.TEST_VIEW:
            return normalNavigate(
              TestView(),
            );
        default:
        return MaterialPageRoute(builder:(context)=>NotFoundNavWidget(),);
      }
      
    }
  MaterialPageRoute normalNavigate(Widget widget){
    return MaterialPageRoute(builder:(context)=> widget);
  }
}