import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/app_constants.dart';
import '../widgets/common_widgets.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    final isTablet = ResponsiveWidget.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : (isTablet ? 20 : 24),
        vertical: isMobile ? 60 : (isTablet ? 70 : 80),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: "Education",
                subtitle: "My academic background",
              ),
              ResponsiveWidget(
                mobile: _MobileEducation(),
                tablet: _TabletEducation(),
                desktop: _DesktopEducation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopEducation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppConstants.education.map((education) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: _EducationCard(education: education),
        );
      }).toList(),
    );
  }
}

class _TabletEducation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppConstants.education.map((education) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: _EducationCard(education: education),
        );
      }).toList(),
    );
  }
}

class _MobileEducation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppConstants.education.map((education) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _EducationCard(education: education),
        );
      }).toList(),
    );
  }
}

class _EducationCard extends StatefulWidget {
  final Map<String, String> education;

  const _EducationCard({required this.education});

  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    final isTablet = ResponsiveWidget.isTablet(context);

    return MouseRegion(
      onEnter: (_) {
        _animationController.forward();
      },
      onExit: (_) {
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GlassCard(
              padding: EdgeInsets.all(isMobile ? 20 : (isTablet ? 24 : 28)),
              child: ResponsiveWidget(
                mobile: _MobileEducationLayout(education: widget.education),
                tablet: _TabletEducationLayout(education: widget.education),
                desktop: _DesktopEducationLayout(education: widget.education),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DesktopEducationLayout extends StatelessWidget {
  final Map<String, String> education;

  const _DesktopEducationLayout({required this.education});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Education Icon
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.accent.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Icon(Icons.school, size: 40, color: AppColors.accent),
        ),
        const SizedBox(width: 24),
        // Education Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Degree
              Text(
                education["degree"] ?? "",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 8),
              // Institution
              Text(
                education["institution"] ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: 6),
              // Duration
              Text(
                education["duration"] ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              // Description
              Text(
                education["description"] ?? "",
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.secondaryText,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabletEducationLayout extends StatelessWidget {
  final Map<String, String> education;

  const _TabletEducationLayout({required this.education});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Education Icon
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.accent.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Icon(Icons.school, size: 35, color: AppColors.accent),
        ),
        const SizedBox(width: 20),
        // Education Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Degree
              Text(
                education["degree"] ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 6),
              // Institution
              Text(
                education["institution"] ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: 4),
              // Duration
              Text(
                education["duration"] ?? "",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              // Description
              Text(
                education["description"] ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryText,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileEducationLayout extends StatelessWidget {
  final Map<String, String> education;

  const _MobileEducationLayout({required this.education});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with Icon and Basic Info
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Education Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.accent.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Icon(Icons.school, size: 30, color: AppColors.accent),
            ),
            const SizedBox(width: 16),
            // Basic Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Degree
                  Text(
                    education["degree"] ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Duration
                  Text(
                    education["duration"] ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Institution
        Text(
          education["institution"] ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 8),
        // Description
        Text(
          education["description"] ?? "",
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.secondaryText,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
