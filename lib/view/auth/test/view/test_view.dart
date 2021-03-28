import 'package:easy_localization/easy_localization.dart';
import 'package:flu_template_s0e4/core/constant/enum/local_keys_enum.dart';
import 'package:flu_template_s0e4/core/init/cache/local_manager.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/lang/lang_dev.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../view_m/test_view_m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../../core/extension/string_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestView extends StatefulWidget {
  TestView({Key key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => Text("data"),
/*       color: themeData.primaryColor,
       height: dynamicHeight(.1),//%1 lik sayfa defaulttan farklı olarak atanır. */
    );
  }

  //hız anlamında get kullanmak iyi olur parametre almıyorsa
  Widget get scaffoldBody => Scaffold(
      appBar: AppBar(
        leading: Text(LocaleManager.instance.getStringValue(LocaleSharedPrefKeys.TOKEN)),
        title: Text(LocaleKeys.welcome.locale),
        actions: [iconButtonChTheme()],
      ), //String Extension ile kullanımı
      /* appBar: AppBar(title: Text(LocaleKeys.welcome).tr(),),//translate işlemi isterseniz bu şekilde de yapılabilir. */
      floatingActionButton: buildfloatingActionButton,
      body: buildTextNum);

  IconButton iconButtonChTheme() {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          context.locale = LanguageDev.instance.enLocale;
        });
  }

  FloatingActionButton get buildfloatingActionButton {
    return FloatingActionButton(
      onPressed: () {
        viewModel.incNumber();
      },
    );
  }

/*   AppBar appBar() {
    return AppBar(
      leading: Text(LanguageDev.instance.getStringValue(PreferencesKeys.TOKEN)),
      title: textWelcomeWidget(),
      actions: [iconButtonChangeTheme()],
    );
  } */
/* 
  IconButton iconButtonChangeTheme() {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          context.locale = LanguageDev.instance.enLocale;
        });
  }
 */
/*   Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);
 */
//text deki değişikliği sadece kendisini tetikler herkes kendi işini yapar.
  Widget get buildTextNum {
    return Observer(
      builder: (context) => Text(viewModel.numb.toString()),
    );
  }

/*   extension _FormArea on _TestsViewState {
  TextFormField get mailField => TextFormField(
        validator: (value) => value.isValidEmail,
      );
} */
}
