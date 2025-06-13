import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/app_constants.dart';
import '../constants/typography.dart';
import '../widgets/common_widgets.dart';
import '../services/navigation_service.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ResponsiveWidget(
        mobile: const _MobileHero(),
        desktop: const _DesktopHero(),
      ),
    );
  }
}

class _DesktopHero extends StatelessWidget {
  const _DesktopHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, I'm", style: AppTypography.bodyLargeSecondary),
              const SizedBox(height: 8),
              Text(AppConstants.name, style: AppTypography.h1),
              const SizedBox(height: 16),
              Text(AppConstants.title, style: AppTypography.accent),
              const SizedBox(height: 24),
              Text(AppConstants.tagline, style: AppTypography.tagline),
              const SizedBox(height: 48),
              Row(
                children: [
                  CustomButton(
                    text: "View My Work",
                    onPressed: () =>
                        NavigationService().scrollToSection('projects'),
                    icon: Icons.work_outline,
                  ),
                  const SizedBox(width: 16),
                  CustomButton(
                    text: "Download CV",
                    onPressed: () => _downloadCV(),
                    isPrimary: false,
                    icon: Icons.download,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _SocialLinks(),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accent.withOpacity(0.3),
                            AppColors.accent.withOpacity(0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 200,
                        color: AppColors.accent,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MobileHero extends StatelessWidget {
  const _MobileHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 3,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/profile.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accent.withOpacity(0.3),
                        AppColors.accent.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 100,
                    color: AppColors.accent,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          "Hi, I'm",
          style: AppTypography.bodyMediumSecondary,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          AppConstants.name,
          style: AppTypography.h1Mobile,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          AppConstants.title,
          style: AppTypography.accentMobile,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          AppConstants.tagline,
          style: AppTypography.taglineMobile,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "View My Work",
                onPressed: () =>
                    NavigationService().scrollToSection('projects'),
                icon: Icons.work_outline,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Download CV",
                onPressed: () => _downloadCV(),
                isPrimary: false,
                icon: Icons.download,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        _SocialLinks(),
      ],
    );
  }
}

class _SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          icon: Icons.email,
          onPressed: () => _launchUrl('mailto:${AppConstants.email}'),
        ),
        const SizedBox(width: 16),
        _SocialImageButton(
          imagePath: 'assets/images/github.png',
          onPressed: () => _launchUrl(AppConstants.github),
        ),
        const SizedBox(width: 16),
        _SocialImageButton(
          imagePath: 'assets/images/linkedin.png',
          onPressed: () => _launchUrl(AppConstants.linkedIn),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: AppColors.accent,
      iconSize: 28,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.button,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class _SocialImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const _SocialImageButton({required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        imagePath,
        width: 28,
        height: 28,
        color: AppColors.accent,
      ),
      iconSize: 28,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.button,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

Future<void> _downloadCV() async {
  final Uri cvUri = Uri.parse(AppConstants.cvUrl);
  if (await canLaunchUrl(cvUri)) {
    await launchUrl(cvUri, mode: LaunchMode.externalApplication);
  } else {
    // Fallback - try to open in browser
    await launchUrl(cvUri, mode: LaunchMode.platformDefault);
  }
}

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    print('Could not launch $url');
  }
}
