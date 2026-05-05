import 'package:flutter/material.dart';

class Assignment {
  final String subject;
  final String grade;
  final String title;
  final String dueDate;
  final int submitted;
  final int total;
  final Color subjectColor;
  final Color gradientStart;
  final Color gradientEnd;

  const Assignment({
    required this.subject,
    required this.grade,
    required this.title,
    required this.dueDate,
    required this.submitted,
    required this.total,
    required this.subjectColor,
    required this.gradientStart,
    required this.gradientEnd,
  });

  double get progress => submitted / total;
  int get progressPercent => (progress * 100).round();
}
