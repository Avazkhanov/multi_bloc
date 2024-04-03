import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:multi_bloc/data/models/transfer_model.dart';
import 'package:multi_bloc/data/my_response.dart';
import 'package:multi_bloc/utils/constants/app_constants.dart';

class ApiProvider {
  static Future<MyResponse> getTranfers() async{
    try {
      http.Response response = await http
          .get(Uri.parse(AppConstants.baseUrl));

      if (response.statusCode == HttpStatus.ok) {
        return MyResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => TransferModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return MyResponse(error: "Noma'lum xatolik");
    } catch (error) {
      return MyResponse(error: error.toString());
    }
  }
}
