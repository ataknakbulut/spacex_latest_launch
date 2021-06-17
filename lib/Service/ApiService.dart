import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:spacex_latest_launch/Model/LaunchModel.dart';

class ApiService {
  static const kHost = "https://api.spacexdata.com/v4/launches/latest";

  static Future<LaunchModel> getLatest() async {
    //print("getLatest called");
    try {
      final response = await http.get(kHost);

      if (response.statusCode == 200) {
        final LaunchModel oturum = apiModelFromJson(response.body);
        return oturum;
      } else {
        //return ApiModel();
      }
    } on SocketException {
      //
    } catch (e, stacktree) {
      print(e);
      print(stacktree);
      //
    }
  }
}
