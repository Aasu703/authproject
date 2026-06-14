import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class OnboardingPage extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;
  final Color accentColor;
  final String titleKey;
  final String descKey;

  const OnboardingPage({
    super.key,
    required this.icon,
    required this.color1,
    required this.color2,
    required this.accentColor,
    required this.titleKey,
    required this.descKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color1, color2],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: AnimationConfiguration.synchronized(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInAnimation(
                  duration: const Duration(milliseconds: 600),
                  child: ScaleAnimation(
                    scale: 0.5,
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: accentColor.withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withOpacity(0.2),
                            blurRadius: 40,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        icon,
                        size: 100,
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 64),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 300),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: Text(
                      tr(titleKey),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: Text(
                      tr(descKey),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white.withOpacity(0.7),
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
