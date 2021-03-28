import 'package:flutter/material.dart';

class NotFoundNavWidget extends StatelessWidget {
  const NotFoundNavWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Text("Sayfa Bulunamadı 404 :)"),);
  }
}