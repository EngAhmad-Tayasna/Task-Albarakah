import 'dart:developer';
import 'package:cash_storing_with_service_layer/model/handle_model.dart';
import 'package:cash_storing_with_service_layer/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../model/result_model.dart';

class UserService {
  Dio dio;
  late Response response;
  String baseUrl = "https://jsonplaceholder.typicode.com/users/1";
  UserModel? user;
  UserService({
    required this.dio,
  });

  Future<ResultModel> getUserProfile() async {
    try {
      var box = await Hive.openBox<UserModel>('userBox');

      if (user == null) {
        log("------------------From NetWork---------------");
        response = await dio.get(baseUrl);
        user = UserModel.fromMap(response.data);

        await box.put('user', user!);
        return user!;
      } else {
        log("-------------From Cache------------");
        user = box.get('user');

        return user!;
      }
    } catch (e) {
      return HandleModel(message: "There is No Data");
    }
  }
}


