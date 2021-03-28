import 'package:flu_template_s0e4/core/init/network/network_manager.dart';
import 'package:flu_template_s0e4/view/auth/test/model/test_model.dart';

import '../../../../core/constant/enum/app_theme_enum.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_m.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  //mobxe göre iki durumun haberleşmesi için annotation kullanılması gerekir @observable
  @observable
  int numb=0;
  @action
  void incNumber(){
    numb++;
  }
  @computed
  bool get isEven=>numb%2==0;
  @observable
  bool isLoading=false;
  BuildContext context;
  void setContext(BuildContext context){
    this.context=context;//tüm sayfalarda kullanmak için contexti
  }

  void changeTheme(){
    Provider.of<ThemeNotifier>(context, listen:false).changeVal(AppThemes.DARK);//değişkiliği ekranda sağlamak.
  }
  @action
  Future<void> getSampRequest() async {
    isLoading=true;
    final list=await NetworkManager.instance.dioGet<TestModel>("x", TestModel());
    if (list is List) {
      //print true
    }
    isLoading=false;
  }
}