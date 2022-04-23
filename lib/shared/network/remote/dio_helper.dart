import 'package:dio/dio.dart';

class DioHelper {

  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://restapi.adequateshop.com",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postLogin( {
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
}) async{
  return await dio!.post("/api/authaccount/login",data: data);
  }


}



//.................................................
// For News App
//import 'package:dio/dio.dart';
//
// class DioHelper {
//
//   static Dio? dio;
//
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: "https://newsapi.org/",
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }
//
//   static Future<Response> getData({
//     required String url,
//     required Map<String,dynamic> query,
//   }) async{
//    return await dio!.get(url ,queryParameters: query);
//   }
//
// }