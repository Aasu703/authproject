import 'package:flutter/material.dart';

class OnboardingData {
  final IconData icon;
  final Color color1;
  final Color color2;
  final Color accentColor;
  final String titleKey;
  final String descKey;

  OnboardingData({
    required this.icon,
    required this.color1,
    required this.color2,
    required this.accentColor,
    required this.titleKey,
    required this.descKey,
  });
}
