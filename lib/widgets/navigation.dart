import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../constants/colors.dart';
import '../constants/typography.dart';
import '../services/navigation_service.dart';
import 'common_widgets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final NavigationService _navigationService = NavigationService();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _navigationService.currentSectionNotifier,
      builder: (context, currentSection, child) {
        return AppBar(
          backgroundColor: AppColors.background.withOpacity(0.95),
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      size: 32,
                      color: AppColors.accent,
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Text('Portfolio', style: AppTypography.h5),
            ],
          ),
          actions: ResponsiveWidget.isDesktop(context)
              ? [
                  _NavButton(
                    'About',
                    () => _navigationService.scrollToSection('about'),
                    isActive: kIsWeb && currentSection == 'about',
                  ),
                  _NavButton(
                    'Experience',
                    () => _navigationService.scrollToSection('experience'),
                    isActive: kIsWeb && currentSection == 'experience',
                  ),
                  _NavButton(
                    'Education',
                    () => _navigationService.scrollToSection('education'),
                    isActive: kIsWeb && currentSection == 'education',
                  ),
                  _NavButton(
                    'Projects',
                    () => _navigationService.scrollToSection('projects'),
                    isActive: kIsWeb && currentSection == 'projects',
                  ),
                  _NavButton(
                    'Contact',
                    () => _navigationService.scrollToSection('contact'),
                    isActive: kIsWeb && currentSection == 'contact',
                  ),
                  const SizedBox(width: 16),
                ]
              : null,
        );
      },
    );
  }

  Widget _NavButton(
    String text,
    VoidCallback onPressed, {
    bool isActive = false,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: isActive ? AppColors.accent : AppColors.primaryText,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          text,
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? AppColors.accent : AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(
          top: BorderSide(color: AppColors.accent.withOpacity(0.1), width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                Icons.email,
                () => _launchUrl('mailto:m.muneeburrehmann@gmail.com'),
              ),
              const SizedBox(width: 16),
              _SocialImageIcon(
                'assets/images/github.png',
                () => _launchUrl('https://github.com/mun33b-exe'),
              ),
              const SizedBox(width: 16),
              _SocialImageIcon(
                'assets/images/linkedin.png',
                () => _launchUrl('https://linkedin.com/in/mun33b-exe'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: AppColors.button),
          const SizedBox(height: 24),
          Text(
            '© 2025 mun33b-exe. All rights reserved.',
            style: TextStyle(color: AppColors.secondaryText, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Developed by Muneeb with Flutter 💙',
            style: TextStyle(color: AppColors.secondaryText, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _SocialIcon(IconData icon, VoidCallback onPressed) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: AppColors.accent,
        iconSize: 24,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.button,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _SocialImageIcon(String imagePath, VoidCallback onPressed) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          imagePath,
          width: 24,
          height: 24,
          color: AppColors.accent,
        ),
        iconSize: 24,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.button,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  void _launchUrl(String url) {
    print('Launching: $url');
  }
}
