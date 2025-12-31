import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:silancar_bloc/src/core/model/login_data_model.dart';
import 'package:silancar_bloc/src/core/network/api_endpoint.dart';
import 'package:silancar_bloc/src/core/network/dio_client.dart';

class AuthRepository {
  Future<LoginDataModel> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    final response = await DioClient.post(
      ApiEndpoints.login,
      body: {"email": email, "password": password},
      fromJson: (json) => LoginDataModel.fromJson(json),
    );
    // log(response!.token.toString());
    if (response != null) {
      DioClient.setToken(response.token);
    }
    return response!;
  }
}
