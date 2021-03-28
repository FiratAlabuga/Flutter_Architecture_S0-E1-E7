import 'package:flu_template_s0e4/core/extension/string_ext.dart';
import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  final String val;
  const LocaleText({Key key, @required this.val,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(val.locale);
  }
}