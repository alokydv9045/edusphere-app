import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndpoint,
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        throw e.response?.data['message'] ?? 'Login failed';
      }
      throw 'Network error. Please check your connection.';
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  Future<Map<String, dynamic>> getMe(String token) async {
    try {
      final response = await _dio.get(
        '/auth/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } catch (e) {
      throw 'Failed to fetch user profile';
    }
  }
}
