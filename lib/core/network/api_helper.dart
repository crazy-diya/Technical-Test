import 'dart:io';

import 'package:dio/dio.dart';
import 'package:technical_test/error/exceptions.dart';

class APIHelper {
  Dio dio;

  APIHelper({required this.dio});

  Future<dynamic> get(String url) async {
    var response;
    try {
      response = await dio.get(url);
    } on SocketException {
    } on DioError {
    } on APIFailException {
    } catch (e) {
      throw Error();
    }
    return response;
  }
}
