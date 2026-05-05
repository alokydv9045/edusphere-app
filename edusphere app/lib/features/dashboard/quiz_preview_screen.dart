import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/custom_bottom_nav_bar.dart';

class QuizPreviewScreen extends StatelessWidget {
  const QuizPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FF),
      body: Stack(
        children: [
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 80, bottom: 180, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Header
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DRAFT PREVIEW',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF004AC6),
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Quiz Preview',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF191B23),
                          letterSpacing: -0.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          const Text(
                            'Mathematics Section A • 25 Questions',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF434655),
                            ),
                          ),
                          Container(
                            height: 16,
                            width: 1,
                            color: const Color(0xFFC3C6D7).withValues(alpha: 0.3),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.timer, size: 16, color: Color(0xFF737686)),
                              SizedBox(width: 4),
                              Text('45m', style: TextStyle(fontSize: 13, color: Color(0xFF434655))),
                              SizedBox(width: 8),
                              Icon(Icons.star, size: 16, color: Color(0xFF737686)),
                              SizedBox(width: 4),
                              Text('100 pts', style: TextStyle(fontSize: 13, color: Color(0xFF434655))),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Question 1
                  _buildQuestionCard(
                    context,
                    number: '01',
                    marks: '4 Marks',
                    color: const Color(0xFF004AC6),
                    questionText: 'Find the value of x in the equation: 2x + 15 = 35',
                    content: Column(
                      children: [
                        _buildMcqOption(context, 'A', 'x = 5', false),
                        const SizedBox(height: 8),
                        _buildMcqOption(context, 'B', 'x = 10', true),
                        const SizedBox(height: 8),
                        _buildMcqOption(context, 'C', 'x = 15', false),
                        const SizedBox(height: 8),
                        _buildMcqOption(context, 'D', 'x = 20', false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Question 2
                  _buildQuestionCard(
                    context,
                    number: '02',
                    marks: '10 Marks',
                    color: const Color(0xFF6B38D4),
                    questionText: 'Explain the Pythagorean Theorem and provide one real-world application.',
                    content: Column(
                      children: [
                        Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDEDF9),
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: NetworkImage('https://lh3.googleusercontent.com/aida/ADBb0uj85-EdZfAIZAAKDUcbWE8OXM2VfASW6LJ7QX4VTQEHhgpLLLMpqI1WbTVwz_gY_8IQ-FOCigm88kg9uJTIJ6Lht9imEFTe71weskgfOTQpnUNJ23QX_JSzgjxMawCrEDVhqLfMY3Sz5KuTVN8dq2DpT6QT4Uv5dk2ll15GvYFfsPA_mYC0nw3wAG9bZKvlY1yGlZ6waqhPO2cuQawfH0Gu43olM4_87kxTfGTSnknMj6EDn9cdEqNFhPQnq05kb1sHtPUSDnuMbK4'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3FE),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFC3C6D7).withValues(alpha: 0.5), style: BorderStyle.solid), // Dashed normally
                          ),
                          child: const Text(
                            'Student response area (Short Answer)',
                            style: TextStyle(fontSize: 13, color: Color(0xFF737686), fontStyle: FontStyle.italic),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDEDF9).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "TEACHER'S ANSWER KEY",
                                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Color(0xFF737686), letterSpacing: 0.5),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "a² + b² = c². Application: Calculating distances for navigation or construction.",
                                style: TextStyle(fontSize: 15, color: Color(0xFF434655)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Question 3
                  _buildQuestionCard(
                    context,
                    number: '03',
                    marks: '6 Marks',
                    color: const Color(0xFF004AC6),
                    questionText: 'Identify the correct 3D representation of a dodecahedron.',
                    content: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDEDF9),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: const Color(0xFFC3C6D7).withValues(alpha: 0.3)),
                                  image: const DecorationImage(
                                    image: NetworkImage('https://lh3.googleusercontent.com/aida/ADBb0ujncOi6a8DRYjQUdxXqhuFYtHUJiu8U8Y3zTK7WPsZmwrUEOarRjvxbIAaumBrQuIsu9KHR9YX7gB9Lkf3e_iIRSrSGxcyYUoulRSjz7kWoYjcpkLAtrVyR1biA5sYxZ5_fd7HcYIoNAZT645OFnLY3vF4ScdZMxP9ZfDkdeHNTlupAxgePB7ubcdAZnXVPBq2RBvUq9U3z-o5FiPFewtZhMcr8lXC8YbdYhMKHFtdrqbtV2LywmcUdLarBfG0Emvh1-I1S7fsA9Q'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('Option A', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF737686))),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDEDF9),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: const Color(0xFF004AC6), width: 2),
                                  image: const DecorationImage(
                                    image: NetworkImage('https://lh3.googleusercontent.com/aida/ADBb0ui0eKTp-hW5-6c6JM7pTSX-0sY5IBe2PaGkqS2DN9MxNX5_bM2CAdhWogceE5rUu1ycpRXprOB53PTAmS10vP43Mc0TPJSjLxY3h4EznCOPuKHW2ogyHjJ3umtJn2TibybI7v-j8qalXLLN47usQMlkJHCnEq43sUnCypuzlkk-V_pDh5OuyZ7_Qwg8sDofSHzJ0XZUDMWd_bOqza198toJsCAHncsJeyuWH7lMKlTL5_CWpWyaQUbaDXoo9gcK9_b3yB8hVQhkJkk'),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF004AC6).withValues(alpha: 0.1),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF004AC6),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.check, size: 16, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('Option B (Correct)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF004AC6))),
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

          // Custom App Bar
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
                    color: Colors.white.withValues(alpha: 0.9),
                    border: Border(bottom: BorderSide(color: const Color(0xFFF1F5F9))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Color(0xFF737686)),
                            onPressed: () => context.pop(),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'EduSphere',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF047857), // emerald-700
                                  letterSpacing: -0.5,
                                ),
                              ),
                              Text(
                                'Midterm Mathematics',
                                style: TextStyle(fontSize: 13, color: Color(0xFF737686)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFF2563EB), width: 2),
                              color: const Color(0xFFE2E8F0),
                            ),
                            child: const Icon(Icons.person, size: 20, color: Color(0xFF64748B)),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.notifications_none, color: Color(0xFF059669)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom Action and Nav Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: ElevatedButton(
                    onPressed: () => context.push('/teacher-dashboard/quizzes/published'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004AC6),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.publish, size: 20),
                        SizedBox(width: 8),
                        Text('Finish Preview & Publish', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                const CustomBottomNavBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(
    BuildContext context, {
    required String number,
    required String marks,
    required Color color,
    required String questionText,
    required Widget content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAF8FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC3C6D7).withValues(alpha: 0.3)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('QUESTION $number', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color, letterSpacing: 0.5)),
                        Row(
                          children: [
                            Text(marks, style: const TextStyle(fontSize: 15, color: Color(0xFF737686))),
                            const SizedBox(width: 8),
                            const Icon(Icons.edit, size: 18, color: Color(0xFF737686)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(questionText, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF191B23), letterSpacing: -0.4)),
                    const SizedBox(height: 24),
                    content,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMcqOption(BuildContext context, String letter, String text, bool isCorrect) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCorrect ? const Color(0xFF004AC6).withValues(alpha: 0.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isCorrect ? const Color(0xFF004AC6).withValues(alpha: 0.2) : Colors.transparent),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isCorrect ? const Color(0xFF004AC6) : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: isCorrect ? const Color(0xFF004AC6) : const Color(0xFF737686)),
            ),
            child: Center(
              child: Text(
                letter,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: isCorrect ? Colors.white : const Color(0xFF191B23)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15, fontWeight: isCorrect ? FontWeight.w600 : FontWeight.w400, color: const Color(0xFF191B23)),
            ),
          ),
          if (isCorrect) const Icon(Icons.check_circle, color: Color(0xFF004AC6), size: 20),
        ],
      ),
    );
  }
}
