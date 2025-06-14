import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';
import '../services/navigation_service.dart';

class MobileNavigation extends StatelessWidget {
  const MobileNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.card,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Portfolio',
                    style: AppTypography.h5.copyWith(color: AppColors.accent),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Muhammad Muneeb Ur Rehman',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: AppColors.button),

            // Navigation Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _NavItem(
                    icon: Icons.home,
                    title: 'Home',
                    onTap: () {
                      Navigator.of(context).pop();
                      NavigationService().scrollToSection('hero');
                    },
                  ),
                  _NavItem(
                    icon: Icons.person,
                    title: 'About',
                    onTap: () {
                      Navigator.of(context).pop();
                      NavigationService().scrollToSection('about');
                    },
                  ),
                  _NavItem(
                    icon: Icons.work,
                    title: 'Experience',
                    onTap: () {
                      Navigator.of(context).pop();
                      NavigationService().scrollToSection('experience');
                    },
                  ),
                  _NavItem(
                    icon: Icons.school,
                    title: 'Education',
                    onTap: () {
                      Navigator.of(context).pop();
                      NavigationService().scrollToSection('education');
                    },
                  ),
                  _NavItem(
                    icon: Icons.code,
                    title: 'Projects',
                    onTap: () {
                      Navigator.of(context).pop();
                      NavigationService().scrollToSection('projects');
                    },
                  ),
                  _NavItem(
                    icon: Icons.contact_mail,
                    title: 'Contact',
                    onTap: () {
                      Navigator.of(context).pop();
                      NavigationService().scrollToSection('contact');
                    },
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Divider(color: AppColors.button),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _SocialIconButton(
                        icon: Icons.email,
                        onPressed: () =>
                            _launchUrl('mailto:m.muneeburrehmann@gmail.com'),
                      ),
                      _SocialImageIconButton(
                        imagePath: 'assets/images/github.png',
                        onPressed: () =>
                            _launchUrl('https://github.com/mun33b-exe'),
                      ),
                      _SocialImageIconButton(
                        imagePath: 'assets/images/linkedin.png',
                        onPressed: () =>
                            _launchUrl('https://linkedin.com/in/mun33b-exe'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) {
    print('Launching: $url');
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.accent, size: 24),
      title: Text(title, style: AppTypography.bodyMedium),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      hoverColor: AppColors.button.withOpacity(0.5),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: AppColors.accent,
        iconSize: 20,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.button,
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}

class _SocialImageIconButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const _SocialImageIconButton({
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          imagePath,
          width: 20,
          height: 20,
          color: AppColors.accent,
        ),
        iconSize: 20,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.button,
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}
