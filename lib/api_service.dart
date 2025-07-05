import 'dart:io';
import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/api";
  final Dio _dio = Dio();

  Future<String?> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/token/',
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data['access'];
      }
    } catch (e) {
      print('Login error: $e');
    }
    return null;
  }

  Future<List<dynamic>?> fetchProjects() async {
    try {
      final response = await _dio.get('$baseUrl/projects/');
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print('Fetch projects error: $e');
    }
    return null;
  }

  Future<bool> uploadProject({
    required String token,
    required String title,
    required String description,
    required String version,
    required File apkFile,
  }) async {
    try {
      String fileName = apkFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        'title': title,
        'description': description,
        'version': version,
        'apk_file': await MultipartFile.fromFile(
          apkFile.path,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        '$baseUrl/projects/',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return response.statusCode == 201;
    } catch (e) {
      print('Upload error: $e');
      return false;
    }
  }
}
