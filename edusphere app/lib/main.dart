import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/splash_screen.dart';
import 'features/auth/role_selection_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/dashboard/teacher_dashboard.dart';
import 'features/dashboard/assignments_page.dart';
import 'features/dashboard/manage_assignment_screen.dart';
import 'features/dashboard/quiz_preview_screen.dart';
import 'features/dashboard/quiz_published_screen.dart';
import 'features/dashboard/grade_book_screen.dart';
import 'features/dashboard/create_assignment_screen.dart';

void main() => runApp(const EduSphereApp());

class EduSphereApp extends StatelessWidget {
  const EduSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EduSphere',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        initialLocation: '/splash',
        routes: [
          GoRoute(
            path: '/splash',
            builder: (c, s) => const SplashScreen(),
          ),
          GoRoute(
            path: '/role-selection',
            builder: (c, s) => const RoleSelectionScreen(),
          ),
          GoRoute(
            path: '/login',
            builder: (c, s) => const LoginScreen(),
          ),
          GoRoute(
            path: '/teacher-dashboard',
            builder: (c, s) => const TeacherDashboard(),
            routes: [
              GoRoute(
                path: 'assignments',
                builder: (c, s) => const AssignmentsPage(),
                routes: [
                  GoRoute(
                    path: 'manage',
                    builder: (c, s) => const ManageAssignmentScreen(),
                  ),
                  GoRoute(
                    path: 'create',
                    builder: (c, s) => const CreateAssignmentScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'quizzes/preview',
                builder: (context, state) => const QuizPreviewScreen(),
              ),
              GoRoute(
                path: 'quizzes/published',
                builder: (context, state) => const QuizPublishedScreen(),
              ),
              GoRoute(
                path: 'gradebook',
                builder: (context, state) => const GradeBookScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}