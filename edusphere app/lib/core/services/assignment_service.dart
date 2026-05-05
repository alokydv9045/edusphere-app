import 'package:dio/dio.dart';
import 'api_service.dart';

class AssignmentService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getTeacherAssignments() async {
    try {
      final response = await _apiService.dio.get('/assignments/teacher');
      return response.data['assignments'];
    } catch (e) {
      throw 'Failed to load assignments';
    }
  }

  Future<List<dynamic>> getStudentAssignments() async {
    try {
      final response = await _apiService.dio.get('/assignments/student');
      return response.data['assignments'];
    } catch (e) {
      throw 'Failed to load assignments';
    }
  }
}
