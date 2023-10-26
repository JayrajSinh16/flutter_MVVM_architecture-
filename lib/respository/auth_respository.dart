import 'package:mvvm_archi/data/network/base_api_services.dart';
import 'package:mvvm_archi/data/network/network_api_services.dart';
import 'package:mvvm_archi/resources/app_urls.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetWorkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}