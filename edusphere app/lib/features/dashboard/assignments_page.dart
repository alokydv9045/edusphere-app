import 'dart:ui';
import 'package:flutter/material.dart';
import 'models/assignment.dart';
import 'widgets/assignment_card.dart';
import 'widgets/create_fab.dart';
import 'widgets/assignment_bottom_nav.dart';

// ─── Sample Data ───────────────────────────────────────────────────────────────

const List<Assignment> _assignments = [
  Assignment(
    subject: 'Mathematics',
    grade: 'Grade 10-A',
    title: 'Introduction to Quadratic Equations',
    dueDate: 'Oct 24, 2023',
    submitted: 18,
    total: 30,
    subjectColor: Color(0xFFEA580C),   // orange-600
    gradientStart: Color(0xFFFB923C), // orange-400
    gradientEnd: Color(0xFFFED7AA),   // orange-200
  ),
  Assignment(
    subject: 'Physics',
    grade: 'Grade 11-C',
    title: 'Electromagnetic Waves Lab Report',
    dueDate: 'Oct 26, 2023',
    submitted: 25,
    total: 28,
    subjectColor: Color(0xFF2563EB),   // blue-600
    gradientStart: Color(0xFF60A5FA), // blue-400
    gradientEnd: Color(0xFFBFDBFE),   // blue-200
  ),
  Assignment(
    subject: 'Literature',
    grade: 'Grade 10-A',
    title: 'Analysis of Modern Poetry',
    dueDate: 'Oct 28, 2023',
    submitted: 5,
    total: 30,
    subjectColor: Color(0xFF9333EA),   // purple-600
    gradientStart: Color(0xFFC084FC), // purple-400
    gradientEnd: Color(0xFFE9D5FF),   // purple-200
  ),
];

// ─── Page ──────────────────────────────────────────────────────────────────────

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FF),
      body: Stack(
        children: [
          // ── Scrollable content ──────────────────────────────────────────────
          SafeArea(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 120),
              itemCount: _assignments.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, i) =>
                  AssignmentCard(assignment: _assignments[i]),
            ),
          ),

          // ── Top AppBar ──────────────────────────────────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  height: MediaQuery.of(context).padding.top + 64,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.82),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2563EB).withValues(alpha: 0.04),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 8,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      // Back button
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Color(0xFF2563EB),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      // Title
                      const Expanded(
                        child: Text(
                          'Assignments',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.3,
                            color: Color(0xFF2563EB),
                          ),
                        ),
                      ),
                      // Avatar
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFDBE1FF),
                            width: 2,
                          ),
                          color: const Color(0xFFE2E8F0),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 18,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Notification
                      const Icon(
                        Icons.notifications_outlined,
                        color: Color(0xFF2563EB),
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── FAB ─────────────────────────────────────────────────────────────
          const Positioned(
            right: 24,
            bottom: 88,
            child: CreateFab(),
          ),

          // ── Bottom Nav ──────────────────────────────────────────────────────
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AssignmentBottomNav(),
          ),
        ],
      ),
    );
  }
}

