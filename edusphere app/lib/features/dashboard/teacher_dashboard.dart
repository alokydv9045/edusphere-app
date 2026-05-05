import 'dart:ui';
import 'package:flutter/material.dart';
import '../../shared/widgets/dashboard_grid_card.dart';
import '../../shared/widgets/feature_tile.dart';
import '../../shared/widgets/custom_bottom_nav_bar.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FF),
      body: Stack(
        children: [
          // Main Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 120, bottom: 100, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header & Greeting
                  const Text(
                    'Teacher Dashboard',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191B23),
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Good Morning, Mr. Smith',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF434655),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Academic Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Academic',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF191B23),
                          letterSpacing: -0.4,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF059669),
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Academic Grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.3,
                    children: const [
                      DashboardGridCard(title: 'Assignments', icon: Icons.edit_document, color: Color(0xFF059669), route: '/teacher-dashboard/assignments'),
                      DashboardGridCard(title: 'Quizzes', icon: Icons.quiz, color: Color(0xFF004AC6), route: '/teacher-dashboard/quizzes/preview'),
                      DashboardGridCard(title: 'Grade Book', icon: Icons.menu_book, color: Color(0xFF6B38D4), route: '/teacher-dashboard/gradebook'),
                      DashboardGridCard(title: 'Student Reports', icon: Icons.analytics, color: Color(0xFFFB923C)),
                      DashboardGridCard(title: 'Syllabus', icon: Icons.list_alt, color: Color(0xFF059669)),
                      DashboardGridCard(title: 'Online Classes', icon: Icons.video_camera_front, color: Color(0xFF004AC6)),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Other Features Section
                  const Text(
                    'Other Features',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF191B23),
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  const FeatureTile(
                    title: 'Event Management',
                    subtitle: 'Organize and track upcoming school events',
                    icon: Icons.event,
                  ),
                  const SizedBox(height: 16),
                  const FeatureTile(
                    title: 'Leave Application',
                    subtitle: 'Submit and review your leave requests',
                    icon: Icons.exit_to_app,
                  ),
                  const SizedBox(height: 16),
                  const FeatureTile(
                    title: 'Resource Sharing',
                    subtitle: 'Manage library and digital learning materials',
                    icon: Icons.share,
                  ),
                  const SizedBox(height: 16),
                  const FeatureTile(
                    title: 'Co-curricular Activities',
                    subtitle: 'Clubs, sports, and after-school programs',
                    icon: Icons.sports_basketball,
                  ),
                ],
              ),
            ),
          ),

          // Top App Bar (Blurred)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  height: 100, // Includes status bar height
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFFE2E8F0).withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'EduSphere',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF059669),
                          letterSpacing: -0.5,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications_none, color: Color(0xFF64748B)),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFD1FAE5), width: 2),
                              color: const Color(0xFFE2E8F0),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 20,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom Navigation Bar
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
