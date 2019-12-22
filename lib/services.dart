import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mapmyindia/mmi.dart';

class ServiceCaller {
  final Dio _dio = Dio();

  Future<MmiToken> fetchMmiToken(MmiTokenRequest mmiTokenRequest) async {
    Map<String, dynamic> jsonMap = mmiTokenRequest.toJson();
    MmiToken mmiToken;
    try {
      String url = 'https://outpost.mapmyindia.com/api/security/oauth/token';
      var result = await _dio.post(url,
          options: Options(contentType: 'application/x-www-form-urlencoded'),
          data: jsonMap);
      mmiToken = MmiToken.fromJson(
        result.data,
      );
      print(result.data.toString());
      return mmiToken;
    } on DioError catch (error) {
      String er = getErrorMessage(error);
      print(error);
      throw er;
    }
  }

  Future<Mmi> fetchMmi(String auth) async {
    Mmi mmi;
    try {
      String url =
          'https://atlas.mapmyindia.com/api/places/nearby/json?keywords=hjjg&refLocation=28.454,77.435';
      var result = await _dio.get(url,
          options: Options(headers: {"Authorization": auth}));
      mmi = Mmi.fromJson(result.data);
      return mmi;
    } on DioError catch (error) {
      String er = getErrorMessage(error);
      throw er;
    }
  }

//* Error Messages
  String errorMessage;
  getErrorMessage(errorsData) {
    try {
      if (errorsData.response != null) {
        var responseData = json.decode(errorsData.response.toString());
        if (responseData['errors'] != null) {
          var errors = responseData['errors'];
          errors.forEach((k, v) => errorMessage = v[0].toString());
        } else {
          errorMessage = "Server error";
        }
      } else {
        errorMessage = "Server error";
      }
      return errorMessage;
    } catch (e) {
      return "Server error";
    }
  }
}
