import 'package:cash_storing_with_service_layer/model/handle_model.dart';
import 'package:cash_storing_with_service_layer/model/user_model.dart';
import 'package:cash_storing_with_service_layer/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:hive/hive.dart';

import '../model/result_model.dart';

class UserProvider extends ChangeNotifier {
  UserService userService = UserService(dio: Dio());
  ResultModel pureData = ResultModel();

  late Box<UserModel> userBox;

  UserProvider() {
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    userBox = await Hive.openBox<UserModel>('userBox');
  }

  void getProfile() async {
    print(pureData.runtimeType);
    if (await InternetConnectionChecker.instance.hasConnection) {
      pureData = await userService.getUserProfile();

      await userBox.put('user', pureData as UserModel);
    } else {

      if (userBox.isEmpty) {
        pureData = HandleModel(
          message: "No cached user data found",
        );
      } else {
        pureData = userBox.get('user')!;
      }
    }

    notifyListeners();
  }
}
