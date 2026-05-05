import 'package:flutter/material.dart';
import '../services/assignment_service.dart';

class AssignmentProvider with ChangeNotifier {
  final AssignmentService _assignmentService = AssignmentService();
  List<dynamic> _assignments = [];
  bool _isLoading = false;
  String? _error;

  List<dynamic> get assignments => _assignments;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchAssignments(String role) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      if (role == 'TEACHER') {
        _assignments = await _assignmentService.getTeacherAssignments();
      } else {
        _assignments = await _assignmentService.getStudentAssignments();
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }
}
