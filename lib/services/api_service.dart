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
      {bool isToken = false}) async {
    APIDataClass apiData =
    APIDataClass(message: 'No data', isSuccess: false, data: '0');

    bool isInternet = await isNetworkConnection();
    if (!isInternet) {
      apiData.message = "No Internet Access";
      apiData.isSuccess = false;
      apiData.data = 0;
      return apiData;
    }

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString(session.accessToken);
      String apiName = "${apiClass.baseUrl}$endPoint";
      log("APINAME ssss $apiName");
      log("TOKEN -- $token");

      Response response;
      Map<String, String> headers = await ApiClass.getHeaders();
      Map<String, String> headersToken = await ApiClass.headersToken(token);
      Options options = Options(headers: isToken ? headersToken : headers);

      // Making the API call based on ApiType
      switch (apiType) {
        case ApiType.post:
          response = await dio.post(apiName, data: body, options: options);
          break;
        case ApiType.get:
          response = await dio.get(apiName, data: body, options: options);
          break;
        case ApiType.put:
          response = await dio.put(apiName, data: body, options: options);
          break;
        case ApiType.delete:
          response = await dio.delete(apiName, data: body, options: options);
          break;
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
      } else {
        var isToken = pref.getString(session.accessToken);
        log("isToken::$isToken");
        apiData.message = "Unexpected response format";
        apiData.isSuccess = false;
      }
      return apiData;
    } on SocketException catch (e) {
      log("SocketException occurred: $e");
      apiData = await dioException(e);
      return apiData;
    } on DioException catch (e) {
      log("DioException occurred: $e");
      apiData = await dioException(e);
      return apiData;
    } catch (e) {
      log("Unexpected error occurred: $e");
      apiData.message = "Something went wrong";
      apiData.isSuccess = false;
      return apiData;
    }
  }


  Future<APIDataClass> dioException(e) async {
    APIDataClass apiData =
        APIDataClass(message: 'No data', isSuccess: false, data: '0');

    if (e.type == DioExceptionType.badResponse) {
      final response = e.response;
      log("Response:dddd ${response.statusCode}");

      if (response?.statusCode == 401) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.clear();
        log("Session expired. Please login again ");
        apiData.message = "Session expired. Please login again.";
        apiData.isSuccess = false;
        apiData.data = 401;
      } else if (response?.statusCode == 403) {
        apiData.message = response?.data.toString() ?? 'Forbidden';
        apiData.isSuccess = false;
        apiData.data = response?.statusCode ?? 403;
      } else {
        apiData.message = response?.data['message'] ?? 'Unknown error';
        apiData.isSuccess = false;
        apiData.data = 0;
      }
    } else {
      apiData.message = e.message!;
      apiData.isSuccess = false;
      apiData.data = 0;
    }

    return apiData;
  }
}
