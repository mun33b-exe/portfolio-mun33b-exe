import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';
import '../services/navigation_service.dart';
import 'common_widgets.dart';
import 'mobile_navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background.withOpacity(0.95),
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text('Portfolio', style: AppTypography.h5),
      actions: ResponsiveWidget.isDesktop(context)
          ? [
              _NavButton(
                'About',
                () => NavigationService().scrollToSection('about'),
              ),
              _NavButton(
                'Experience',
                () => NavigationService().scrollToSection('experience'),
              ),
              _NavButton(
                'Projects',
                () => NavigationService().scrollToSection('projects'),
              ),
              _NavButton(
                'Contact',
                () => NavigationService().scrollToSection('contact'),
              ),
              const SizedBox(width: 16),
            ]
          : null,
    );
  }

  Widget _NavButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryText,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(
        text,
        style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
              _SocialIcon(
                Icons.code,
                () => _launchUrl('https://github.com/mun33b-exe'),
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                Icons.work,
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
            'Developed with Flutter 💙',
            style: TextStyle(color: AppColors.secondaryText, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _SocialIcon(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: AppColors.accent,
      iconSize: 24,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.button,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _launchUrl(String url) {
    print('Launching: $url');
  }
}
