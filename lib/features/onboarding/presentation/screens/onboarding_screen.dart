// lib/features/onboarding/presentation/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:authproject/injection_container.dart' as di;
import 'package:authproject/features/auth/presentation/screens/login_screen.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_header.dart';
import '../widgets/onboarding_navigation.dart';
import '../widgets/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _slides = [
    OnboardingData(
      icon: Icons.security_rounded,
      color1: const Color(0xFF0F172A),
      color2: const Color(0xFF1E293B),
      accentColor: const Color(0xFF2DD4BF),
      titleKey: 'onboarding.slide1_title',
      descKey: 'onboarding.slide1_desc',
    ),
    OnboardingData(
      icon: Icons.layers_rounded,
      color1: const Color(0xFF0F172A),
      color2: const Color(0xFF1E293B),
      accentColor: const Color(0xFFF43F5E),
      titleKey: 'onboarding.slide2_title',
      descKey: 'onboarding.slide2_desc',
    ),
    OnboardingData(
      icon: Icons.language_rounded,
      color1: const Color(0xFF0F172A),
      color2: const Color(0xFF1E293B),
      accentColor: const Color(0xFF3B82F6),
      titleKey: 'onboarding.slide3_title',
      descKey: 'onboarding.slide3_desc',
    ),
  ];

  Future<void> _completeOnboarding() async {
    final prefs = di.sl<SharedPreferences>();
    await prefs.setBool('onboarding_completed', true);
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Slides
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _slides.length,
            itemBuilder: (context, index) {
              final slide = _slides[index];
              return OnboardingPage(
                icon: slide.icon,
                color1: slide.color1,
                color2: slide.color2,
                accentColor: slide.accentColor,
                titleKey: slide.titleKey,
                descKey: slide.descKey,
              );
            },
          ),

          // Header
          OnboardingHeader(
            currentPage: _currentPage,
            totalPages: _slides.length,
            onSkip: _completeOnboarding,
          ),

          // Navigation
          OnboardingNavigation(
            currentPage: _currentPage,
            totalPages: _slides.length,
            accentColor: _slides[_currentPage].accentColor,
            onNext: () {
              if (_currentPage < _slides.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              } else {
                _completeOnboarding();
              }
            },
          ),
        ],
      ),
    );
  }
}
