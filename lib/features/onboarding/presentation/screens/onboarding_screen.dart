// lib/features/onboarding/presentation/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:authproject/injection_container.dart' as di;
import 'package:authproject/features/auth/presentation/screens/login_screen.dart';

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
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [slide.color1, slide.color2],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 48),
                        // Animated Icon Container
                        Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: slide.accentColor.withOpacity(0.3),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: slide.accentColor.withOpacity(0.15),
                                blurRadius: 40,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(
                            slide.icon,
                            size: 88,
                            color: slide.accentColor,
                          ),
                        ),
                        const SizedBox(height: 64),
                        // Text Section
                        Text(
                          tr(slide.titleKey),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          tr(slide.descKey),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.7),
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Header with Language switcher & Skip button
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Language Swifter Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Locale>(
                      value: EasyLocalization.of(context)?.locale ?? context.locale,
                      dropdownColor: const Color(0xFF1E293B),
                      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white70, size: 20),
                      style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                      items: const [
                        DropdownMenuItem(
                          value: Locale('en'),
                          child: Text('🇺🇸 EN'),
                        ),
                        DropdownMenuItem(
                          value: Locale('es'),
                          child: Text('🇪🇸 ES'),
                        ),
                      ],
                      onChanged: (locale) {
                        if (locale != null) {
                          EasyLocalization.of(context)?.setLocale(locale);
                        }
                      },
                    ),
                  ),
                ),

                // Skip button
                if (_currentPage < _slides.length - 1)
                  TextButton(
                    onPressed: _completeOnboarding,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                    ),
                    child: Text(
                      tr('onboarding.skip'),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 24,
            left: 32,
            right: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Page Indicator
                Row(
                  children: List.generate(
                    _slides.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 8),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? _slides[_currentPage].accentColor
                            : Colors.white30,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                // Next / Get Started Button
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _slides.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _completeOnboarding();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _slides[_currentPage].accentColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    _currentPage == _slides.length - 1
                        ? tr('onboarding.get_started')
                        : tr('onboarding.next'),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
