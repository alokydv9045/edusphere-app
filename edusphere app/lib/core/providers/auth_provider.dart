import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _user;
  String? _token;

  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get user => _user;
  bool get isAuthenticated => _token != null;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _authService.login(email, password);
      _token = response['token'];
      
      // Fetch full user profile
      final userResponse = await _authService.getMe(_token!);
      _user = userResponse['user'];
      
      // Save token to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', _token!);
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('auth_token')) return;
    _token = prefs.getString('auth_token');
    
    try {
      final userResponse = await _authService.getMe(_token!);
      _user = userResponse['user'];
      notifyListeners();
    } catch (e) {
      _token = null;
      await prefs.remove('auth_token');
      notifyListeners();
    }
  }
}
