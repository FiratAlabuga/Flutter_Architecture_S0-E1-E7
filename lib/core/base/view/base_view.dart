import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
//sayfa ile state arası ilişki mobx için store den türemesi gerekir.
class BaseView<T extends Store> extends StatefulWidget {
  final T viewModel;// değiştirilemez final
  final Widget Function(BuildContext context,T value) onPageBuilder;
  final Function(T model) onModelReady;
  final VoidCallback onDispose;
  //zorunluluklar olmalı 
  BaseView({Key key,@required this.viewModel,this.onModelReady,this.onDispose,@required this.onPageBuilder}) : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}
class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    //Sayfa ayağı kalktığında call back için pramaetre döndürelecekse func callback. 
    super.initState();
    if(widget.onModelReady !=null) widget.onModelReady(widget.viewModel);

  }
  @override
  void dispose() {
    super.dispose();
    if(widget.onDispose !=null) widget.onDispose();//sayfa ile ilgili yapılanları çalıştır.
  }
  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context,widget.viewModel);//sayfayı çiz.
  }
}