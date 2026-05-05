import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/providers/auth_provider.dart';
import '../../shared/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both email and password'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.login(email, password);

    if (success && mounted) {
      final role = authProvider.user?['role'];
      if (role == 'TEACHER') {
        context.go('/teacher-dashboard');
      } else if (role == 'STUDENT') {
        context.go('/teacher-dashboard'); // Fallback for now
      } else {
        context.go('/teacher-dashboard');
      }
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.error ?? 'Login failed. Please check your credentials.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FF),
      body: Stack(
        children: [
          // Background Decorative Elements
          Positioned(
            bottom: -30,
            right: -15,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x0D8455EF),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: -30,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x0D2563EB),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          
          // Hero Image Area
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 353,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBsJmOTkejrN7Xk2a0mfk10_JAOFVEPDgvDAddEpN5VZgRnh1CzJfcA2MK5KSQ6lUYOXGUgCe0LeDtxvJVBL3GxnL09C8S3epKBs8gGTEbS1a6tzQaa0pUOOmyL1CC1PnFnaaOUgnZQEwHrtkegE2-L4VNSAYo2L0TFk8lA3f9KFLoHGpAg85HpQF7dkE8E641o1PGGllxax0p2F1Hf9EiMaRVw54FSMkQ3QbQqy_J4pLfpzQP7ByiMpJ6NzqgVbB21xwzp_0MC0IT6',
                    width: double.infinity,
                    height: 353,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.overlay,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF2563EB).withValues(alpha: 0.2),
                        const Color(0xFF8455EF).withValues(alpha: 0.1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'EduSphere',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF191B23),
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF434655),
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Sign in to access your dashboard',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF737686),
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Glassmorphic Form Container
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.4),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF2563EB).withValues(alpha: 0.08),
                                blurRadius: 32,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                child: Text(
                                  'EMAIL OR ID',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF434655),
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                hintText: 'name@edusphere.com',
                                icon: Icons.mail_outline,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                              ),
                              const SizedBox(height: 24),

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                child: Text(
                                  'PASSWORD',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF434655),
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                hintText: '••••••••',
                                icon: Icons.lock_outline,
                                obscureText: _obscurePassword,
                                isPassword: true,
                                controller: _passwordController,
                                onVisibilityToggle: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              const SizedBox(height: 32),

                              // Login Button
                              Consumer<AuthProvider>(
                                builder: (context, auth, _) {
                                  return Container(
                                    width: double.infinity,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFF004AC6), Color(0xFF2563EB)],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF004AC6).withValues(alpha: 0.2),
                                          blurRadius: 16,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: auth.isLoading ? null : _handleLogin,
                                        borderRadius: BorderRadius.circular(12),
                                        child: Center(
                                          child: auth.isLoading
                                              ? const SizedBox(
                                                  height: 24,
                                                  width: 24,
                                                  child: CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 2.5,
                                                  ),
                                                )
                                              : const Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Login',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.white,
                                                        letterSpacing: -0.3,
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
