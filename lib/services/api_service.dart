import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:goapp/config.dart';
import 'package:goapp/services/environment.dart';
import 'api_data_class.dart';

enum ApiType { post, get, put, delete, patch }

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,
          style:
              AppCss().dmDenseMedium12.textColor(appColor(context).darkText))));
}

class ApiServices {
  final dio = Dio();

  Future<APIDataClass> commonApi(endPoint, dynamic body, ApiType apiType,
      {isToken = false}) async {
    APIDataClass apiData =
        APIDataClass(message: 'No data', isSuccess: false, data: '0');

    bool isInternet = await isNetworkConnection();
    if (!isInternet) {
      apiData.message = "No Internet Access";
      apiData.isSuccess = false;
      apiData.data = 0;
      return apiData;
    } else {
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        String? token = pref.getString(session.accessToken);
        String apiName = "${apiClass.baseUrl}$endPoint";
        log("APINAME ssss $apiName");
        Response response;
        Options options = Options(
            headers: isToken ? ApiClass.headersToken(token) : ApiClass.headers);

        switch (apiType) {
          case ApiType.post:
            response = await dio.post(apiName, data: body, options: options);
          case ApiType.get:
            log("ApiType ${ApiType.get}");
            response = await dio.get(apiName, data: body, options: options);
          case ApiType.put:
            response = await dio.put(apiName, data: body, options: options);
          case ApiType.delete:
            response = await dio.delete(apiName, data: body, options: options);
          case ApiType.patch:
            response = await dio.patch(apiName, data: body, options: options);
            break;
        }

        var responseData = response.data;

        if (responseData is Map<String, dynamic>) {
          apiData.message = responseData['message'] ?? '';
          apiData.isSuccess = responseData['success'] ?? true;
          apiData.data = responseData['data'] ?? responseData;
        } else if (responseData is List) {
          apiData.message = "Unexpected list response";
          apiData.isSuccess = true;
          apiData.data = responseData;
        }
        return apiData;
      } on SocketException catch (e) {
        apiData = await dioException(e);
        return apiData;
      }
    }
  }

  Future<APIDataClass> dioException(e) async {
    APIDataClass apiData =
        APIDataClass(message: 'No data', isSuccess: false, data: '0');
    if (e is DioException) {
      if (e.type == DioExceptionType.badResponse) {
        final response = e.response;
        if (response!.statusCode == 403) {
          apiData.message = response.data.toString();
          apiData.isSuccess = false;
          apiData.data = response.statusCode;

          return apiData;
        } else {
          if (response.data != null) {
            apiData.message = response.data['message'];
            apiData.isSuccess = false;
            apiData.data = 0;
            return apiData;
          } else {
            apiData.message = response.data.toString();
            apiData.isSuccess = false;
            apiData.data = 0;
            return apiData;
          }
        }
      } else {
        final response = e.response;
        if (response != null && response.data != null) {
          final Map responseData = json.decode(response.data as String) as Map;
          apiData.message = responseData['message'] as String;
          apiData.isSuccess = false;
          apiData.data = 0;
          return apiData;
        } else {
          apiData.message = response!.statusCode.toString();
          apiData.isSuccess = false;
          apiData.data = 0;
          return apiData;
        }
      }
    } else {
      apiData.message = "";
      apiData.isSuccess = false;
      apiData.data = 0;
      return apiData;
    }
  }
}
