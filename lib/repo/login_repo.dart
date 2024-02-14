import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpie_practical_interview/exceptions/app_exception.dart';
import 'package:kpie_practical_interview/providers/dio_provider.dart';

final loginRepo = Provider((ref) => LoginRepo(ref.read(dio)));

class LoginRepo {
  final Dio _dio;

  LoginRepo(this._dio);

  Future<void> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'auth',
        data: FormData.fromMap(
          {
            'server_key': '1eca16c1127fcaf8266a3ae56dffb540f5eaac9f-889fe0e508bf0365111cc95114e29263-88061744',
            'username': username,
            'password': password,
            'device_type': 'phone',
          },
        ),
      );

      if (response.data['api_status'] == "400") {
        throw AppException(message: response.data['errors']['error_text']);
      }
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
