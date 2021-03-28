import 'package:flutter/material.dart';

class LanguageDev{
    static LanguageDev _instance;
    static LanguageDev get instance {
      if (_instance == null) _instance=LanguageDev._init();
      return _instance;
    }
    LanguageDev._init();//dışarıya kapattık sadece bu sınıfa özel
    final enLocale=Locale("en","US");
    List<Locale> get supportedLocal =>[enLocale]; //array olan enLocalSupport
}