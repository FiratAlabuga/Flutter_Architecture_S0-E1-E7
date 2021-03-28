import 'package:flutter/material.dart';


//belli durumlarda kullandığımız kendi BaseStateimiz
abstract class BaseState<T extends StatefulWidget> extends State<T> {
ThemeData get themeData =>Theme.of(context);
double dynamicHeight(double value) =>MediaQuery.of(context).size.height * value;//heightdynamic
double dynamicWidth(double value) =>MediaQuery.of(context).size.width * value; 
}