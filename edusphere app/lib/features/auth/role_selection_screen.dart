import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/role_card.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String _selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 32),
              // Top Branding Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2563EB).withValues(alpha: 0.2),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.school_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'EduSphere',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF004AC6),
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              
              // Header
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Continue as',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF191B23),
                    letterSpacing: -0.4,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please select your account type to get started.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF434655),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Role Cards
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RoleCard(
                        role: 'Student',
                        subtitle: 'Access your classes & results',
                        bgIcon: Icons.person,
                        icon: Icons.school,
                        bgColor: const Color(0xFF2563EB),
                        isSelected: _selectedRole == 'Student',
                        onTap: () {
                          setState(() {
                            _selectedRole = 'Student';
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      RoleCard(
                        role: 'Teacher',
                        subtitle: 'Manage classes & attendance',
                        bgIcon: Icons.library_books_rounded, // fallback for clinical_notes
                        icon: Icons.supervisor_account,
                        bgColor: const Color(0xFF10B981),
                        isSelected: _selectedRole == 'Teacher',
                        onTap: () {
                          setState(() {
                            _selectedRole = 'Teacher';
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Action Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 24, top: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _selectedRole.isNotEmpty
                            ? () {
                                context.go('/login');
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          disabledBackgroundColor: const Color(0xFF2563EB).withValues(alpha: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: _selectedRole.isNotEmpty ? 4 : 0,
                          shadowColor: const Color(0xFF2563EB).withValues(alpha: 0.4),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.chevron_right, color: Colors.white, size: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: const TextSpan(
                        text: 'By continuing, you agree to our ',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF434655),
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              color: Color(0xFF004AC6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
