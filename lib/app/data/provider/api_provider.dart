import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class APIprovider {
  final box = GetStorage();
  final _dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8000/api",
      contentType: "application/json",
      responseType: ResponseType.json,
      receiveTimeout: Duration(seconds: 60),
      sendTimeout: Duration(seconds: 60),
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  Future<Response> register({
    required String email,
    required String password,
    required String confirmPass,
    required String name,
    required String fcm_token,
    File? image,
  }) async {
    final formdata = FormData.fromMap({
      'fcm_token': fcm_token,
      'email': email,
      'password': password,
      'name': name,
      'password_confirmation': confirmPass,
      'avatar': image != null ? await MultipartFile.fromFile(image.path) : null,
    });
    try {
      return await _dio.post(
        '/register',
        data: formdata,
        options: Options(
          headers: {
            "Content-Type": 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final formdata = FormData.fromMap({'email': email, 'password': password});
    try {
      return await _dio.post(
        '/login',
        data: formdata,
        options: Options(
          headers: {
            "Content-Type": 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getproduct() async {
    try {
      return await _dio.get(
        '/products',

        options: Options(
          headers: {
            "Content-Type": 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response> getProductByCate(int id) async {
    try {
      return await _dio.get(
        "/productsbycategory/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } catch (e) {
      print("Errrrorrr:$e");
      rethrow;
    }
  }

  Future<Response> getProfile() async {
    final token = box.read("token");
    try {
      return _dio.get(
        "/me",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": 'application/json',
            "Authorization": "Bearer $token",
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> searchProduct(String name) async {
    try {
      return await _dio.get(
        "/search",
        data: {"name": name},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": 'application/json',
          },
          validateStatus: (status) {
            return status! < 500;
          },
          followRedirects: false,
        ),
      );
    } catch (e) {
      print("error:$e");
      rethrow;
    }
  }
}
