import 'package:easy_localization/easy_localization.dart';
import 'package:flu_template_s0e4/core/init/cache/local_manager.dart';
import 'core/init/navigation/nav_route.dart';
import 'core/init/navigation/nav_service.dart';
import 'core/init/notifier/provider_setlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constant/app_const.dart';
import 'core/init/lang/lang_dev.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/auth/test/view/test_view.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(MultiProvider(
    providers: [...AppProvider.instance.dependItems],
    child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageDev.instance.supportedLocal,
        path: AppConstant.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [...AppProvider.instance.dependItems],
        child: MaterialApp(
          theme: Provider.of<ThemeNotifier>(context, listen: false)
              .currentTheme, //
          home: TestView(),
          onGenerateRoute: NavigationRoute.instance.genRoute,
          navigatorKey: NavigationServ.instance.navigatorKey,
        ));
  }
}
