import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/custom_bottom_nav_bar.dart';

class QuizPublishedScreen extends StatelessWidget {
  const QuizPublishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FF),
      body: Stack(
        children: [
          // Main Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 120),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Success Animation Placeholder
                  Center(
                    child: SizedBox(
                      width: 192,
                      height: 192,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF2563EB).withValues(alpha: 0.1),
                            ),
                            transform: Matrix4.identity()..scale(1.1, 1.1, 1.1),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF2563EB).withValues(alpha: 0.05),
                            ),
                            transform: Matrix4.identity()..scale(1.25, 1.25, 1.25),
                          ),
                          Container(
                            width: 128,
                            height: 128,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2563EB),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF2563EB).withValues(alpha: 0.2),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Quiz Published!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191B23),
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'The Midterm Mathematics quiz is now live and students can begin their attempts.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF737686),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Quiz Summary Bento
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'QUIZ SUMMARY',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF004AC6),
                                letterSpacing: 1.5,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF004AC6).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'Active Now',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF004AC6),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F3FE),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(Icons.quiz, color: Color(0xFF004AC6), size: 20),
                                    SizedBox(height: 8),
                                    Text('25', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF191B23))),
                                    Text('Questions', style: TextStyle(fontSize: 13, color: Color(0xFF737686))),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F3FE),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(Icons.schedule, color: Color(0xFF004AC6), size: 20),
                                    SizedBox(height: 8),
                                    Text('45', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF191B23))),
                                    Text('Minutes', style: TextStyle(fontSize: 13, color: Color(0xFF737686))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3FE),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
                                ),
                                child: const Icon(Icons.groups, color: Color(0xFF004AC6)),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Grade 10-A', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF191B23))),
                                  Text('Target Audience', style: TextStyle(fontSize: 13, color: Color(0xFF737686))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Action Buttons
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      shadowColor: const Color(0xFF2563EB).withValues(alpha: 0.25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.share, size: 20),
                        SizedBox(width: 8),
                        Text('Share Quiz Link', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () => context.go('/teacher-dashboard'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF434655),
                      minimumSize: const Size(double.infinity, 56),
                      side: const BorderSide(color: Color(0xFFC3C6D7), width: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Back to Dashboard', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 32),
                  
                  // Decorative Illustration
                  Opacity(
                    opacity: 0.4,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida/ADBb0ugJ0orwiZLYq5OkzsKXippoURh_78BaIXN0THwBlV7nTgKon-LSJ_sr35MoRsF6oNvGjCgrxEWe5qQsT9d_V4y2eQJ2WPxx-UP9J8yiCLFHTbiUNREqbUCH50B8tmIvivWKCC8zuLxTKSDtmcZYHUTps9BWuy7yWIkbQddtnEYhv3IJvLAwitrSmF7BDUwWL9KI3MNpeveadWnONpR0e4ypKB9c5zxsdyrfX-ajlpj_fz4-MA6I0mU_GzVNh6mdH2C9aJl4kXY4nQ',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Custom Top App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  height: MediaQuery.of(context).padding.top + 56,
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    border: Border(bottom: BorderSide(color: const Color(0xFFE2E8F0).withValues(alpha: 0.5))),
                    boxShadow: [
                      BoxShadow(color: const Color(0xFF2563EB).withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFF2563EB), width: 2),
                            ),
                            child: const ClipOval(
                              child: Icon(Icons.person, color: Color(0xFF64748B)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'EduSphere',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF2563EB), // blue-600
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_none, color: Color(0xFF64748B)),
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: const Color(0xFFF1F5F9).withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom Navigation
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
