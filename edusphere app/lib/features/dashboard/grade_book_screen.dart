import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/custom_bottom_nav_bar.dart';

class GradeBookScreen extends StatelessWidget {
  const GradeBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // Main Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 80, bottom: 120, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  const Text(
                    'Grade Book',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191B23),
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDEDF9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'MAT-10A',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF004AC6)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Class 10-A • Mathematics (Term 2)',
                        style: TextStyle(fontSize: 15, color: Color(0xFF434655)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Actions (Search, Filter, Save)
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFC3C6D7).withValues(alpha: 0.5)),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Find student...',
                        hintStyle: TextStyle(color: Color(0xFF737686)),
                        prefixIcon: Icon(Icons.search, color: Color(0xFF737686)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.tune, size: 18),
                          label: const Text('Filter'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF191B23),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: const Color(0xFFC3C6D7).withValues(alpha: 0.5)),
                            minimumSize: const Size(0, 48),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            elevation: 1,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.save, size: 18),
                          label: const Text('Save Marks'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF004AC6),
                            minimumSize: const Size(0, 48),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            elevation: 4,
                            shadowColor: const Color(0xFF004AC6).withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Bento Stats
                  Column(
                    children: [
                      _buildStatCard(
                        icon: Icons.groups,
                        iconColor: const Color(0xFF004AC6),
                        bgColor: const Color(0xFFDBE1FF),
                        label: 'STUDENTS',
                        value: '32',
                      ),
                      const SizedBox(height: 16),
                      _buildStatCard(
                        icon: Icons.analytics,
                        iconColor: const Color(0xFF943700),
                        bgColor: const Color(0xFFFFDBCD),
                        label: 'AVERAGE',
                        value: '76%',
                      ),
                      const SizedBox(height: 16),
                      _buildStatCard(
                        icon: Icons.notification_important,
                        iconColor: const Color(0xFFBA1A1A),
                        bgColor: const Color(0xFFFFDAD6).withValues(alpha: 0.5),
                        label: 'AT RISK',
                        value: '03',
                        valueColor: const Color(0xFFBA1A1A),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Modern Marks Table
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFC3C6D7).withValues(alpha: 0.3)),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor: WidgetStateProperty.all(const Color(0xFFFFFFFF)),
                            dividerThickness: 1,
                            columns: const [
                              DataColumn(label: Text('STUDENT DETAILS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF434655)))),
                              DataColumn(label: Text('ID', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF434655)))),
                              DataColumn(label: Text('INTERNAL (20)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF434655)))),
                              DataColumn(label: Text('THEORY (80)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF434655)))),
                              DataColumn(label: Text('TOTAL', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF434655)))),
                              DataColumn(label: Text('GRADE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF434655)))),
                            ],
                            rows: [
                              _buildDataRow(
                                name: 'Alice Cooper',
                                badge: 'TOP PERFORMER',
                                badgeColor: Colors.green,
                                id: 'S1001',
                                internal: '19',
                                theory: '76',
                                total: '95',
                                grade: 'A+',
                                isAtRisk: false,
                              ),
                              _buildDataRow(
                                name: 'Bob Smith',
                                badge: '',
                                badgeColor: Colors.transparent,
                                id: 'S1002',
                                internal: '14',
                                theory: '55',
                                total: '69',
                                grade: 'B',
                                isAtRisk: false,
                              ),
                              _buildDataRow(
                                name: 'Charlie Davis',
                                badge: 'AT RISK',
                                badgeColor: const Color(0xFFBA1A1A),
                                id: 'S1003',
                                internal: '8',
                                theory: '25',
                                total: '33',
                                grade: 'F',
                                isAtRisk: true,
                              ),
                              _buildDataRow(
                                name: 'Eve Evans',
                                badge: '',
                                badgeColor: Colors.transparent,
                                id: 'S1004',
                                internal: '--',
                                theory: '--',
                                total: '--',
                                grade: '-',
                                isAtRisk: false,
                              ),
                            ],
                          ),
                        ),
                        // Footer Pagination
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Showing 4 of 32', style: TextStyle(fontSize: 12, color: Color(0xFF737686))),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.chevron_left, size: 18),
                                    onPressed: null,
                                  ),
                                  const Text('Page 1 / 8', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                  IconButton(
                                    icon: const Icon(Icons.chevron_right, size: 18),
                                    onPressed: () {},
                                  ),
                                ],
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
                          IconButton(
                            icon: const Icon(Icons.menu, color: Color(0xFF64748B)),
                            onPressed: () => context.pop(),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xFF004AC6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.auto_stories, color: Colors.white, size: 18),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'EduSphere',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF191B23),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.notifications_none, color: Color(0xFF64748B)),
                          const SizedBox(width: 12),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              color: const Color(0xFFE2E8F0),
                            ),
                            child: const Icon(Icons.person, size: 20, color: Color(0xFF64748B)),
                          ),
                        ],
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

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFC3C6D7).withValues(alpha: 0.3)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1))],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF434655), letterSpacing: 1),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: valueColor ?? const Color(0xFF191B23)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow({
    required String name,
    required String badge,
    required Color badgeColor,
    required String id,
    required String internal,
    required String theory,
    required String total,
    required String grade,
    required bool isAtRisk,
  }) {
    return DataRow(
      color: WidgetStateProperty.all(isAtRisk ? const Color(0xFFBA1A1A).withValues(alpha: 0.05) : Colors.transparent),
      cells: [
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isAtRisk ? const Color(0xFFBA1A1A).withValues(alpha: 0.2) : const Color(0xFFEDEDF9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    name.split(' ').map((e) => e[0]).take(2).join(),
                    style: TextStyle(fontWeight: FontWeight.w700, color: isAtRisk ? const Color(0xFFBA1A1A) : const Color(0xFF737686)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF191B23))),
                  if (badge.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: badgeColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: badgeColor),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        DataCell(Text(id, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF737686)))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              color: isAtRisk ? Colors.white : const Color(0xFFF3F3FE),
              borderRadius: BorderRadius.circular(8),
              border: isAtRisk ? Border.all(color: const Color(0xFFBA1A1A).withValues(alpha: 0.3)) : null,
            ),
            child: Text(internal, style: TextStyle(fontWeight: FontWeight.w600, color: isAtRisk ? const Color(0xFFBA1A1A) : const Color(0xFF004AC6))),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              color: isAtRisk ? Colors.white : const Color(0xFFF3F3FE),
              borderRadius: BorderRadius.circular(8),
              border: isAtRisk ? Border.all(color: const Color(0xFFBA1A1A).withValues(alpha: 0.3)) : null,
            ),
            child: Text(theory, style: TextStyle(fontWeight: FontWeight.w600, color: isAtRisk ? const Color(0xFFBA1A1A) : const Color(0xFF004AC6))),
          ),
        ),
        DataCell(Text(total, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: isAtRisk ? const Color(0xFFBA1A1A) : const Color(0xFF004AC6)))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isAtRisk ? const Color(0xFFBA1A1A) : (grade == 'A+' ? const Color(0xFF2563EB) : const Color(0xFFE1E2ED)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              grade,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: (isAtRisk || grade == 'A+') ? Colors.white : const Color(0xFF434655)),
            ),
          ),
        ),
      ],
    );
  }
}
