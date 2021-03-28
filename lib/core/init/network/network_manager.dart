import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flu_template_s0e4/core/base/model/base_err.dart';
import 'package:flu_template_s0e4/core/base/model/base_model.dart';
import 'package:flu_template_s0e4/core/constant/enum/local_keys_enum.dart';
import 'package:flu_template_s0e4/core/init/cache/local_manager.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    //dışarıya kapattık sadece bu sınıfa özel
    final baseOpt =
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com", headers: {
      "val": LocaleManager.instance.getStringValue(LocaleSharedPrefKeys.TOKEN)
    });
    var _dios = Dio(baseOpt);
    _dios.interceptors.add(InterceptorsWrapper(onRequest: (opt) {
      opt.path += "firat";
    }, onResponse: (e) {
      return e.data;
    }, onError: (e) {
      return BaseError(e.message);
    }));
  }

  //bir dio model gelen veriye göre list map ayıklama
  Dio _dio;
  Future dioGet<T extends BaseModel> (String path,T model) async{
    final response=await _dio.get(path);
   switch (response.statusCode) {
     case HttpStatus.ok:
       final responseBody=response.data;
       if(responseBody is List){
         return responseBody.map((e) =>model.fromJson(e)).toList();
       }else if(responseBody is Map){
         return model.fromJson(responseBody);
       }
       return responseBody;
       break;
     default:
   } 
    
  }
}
