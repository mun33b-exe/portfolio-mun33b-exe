import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/app_constants.dart';
import '../widgets/common_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ResponsiveWidget(
            mobile: const _MobileAbout(),
            desktop: const _DesktopAbout(),
          ),
        ),
      ),
    );
  }
}

class _DesktopAbout extends StatelessWidget {
  const _DesktopAbout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: "About Me",
                subtitle: "Get to know me better",
              ),
              Text(
                AppConstants.aboutText,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.secondaryText,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  _StatCard(
                    title: "5+",
                    subtitle: "Years Experience",
                    icon: Icons.work_history,
                  ),
                  const SizedBox(width: 24),
                  _StatCard(
                    title: "50+",
                    subtitle: "Projects Completed",
                    icon: Icons.check_circle,
                  ),
                  const SizedBox(width: 24),
                  _StatCard(
                    title: "100K+",
                    subtitle: "Users Reached",
                    icon: Icons.people,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 80),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Skills & Technologies",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 24),
              _SkillsGrid(),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileAbout extends StatelessWidget {
  const _MobileAbout();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: "About Me",
          subtitle: "Get to know me better",
        ),
        Text(
          AppConstants.aboutText,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.secondaryText,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _StatCard(title: "5+", subtitle: "Years", icon: Icons.work_history),
            _StatCard(
              title: "50+",
              subtitle: "Projects",
              icon: Icons.check_circle,
            ),
            _StatCard(title: "100K+", subtitle: "Users", icon: Icons.people),
          ],
        ),
        const SizedBox(height: 48),
        const Text(
          "Skills & Technologies",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 24),
        _SkillsGrid(),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(icon, color: AppColors.accent, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.secondaryText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: AppConstants.skills.map((skill) => _SkillChip(skill)).toList(),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String skill;

  const _SkillChip(this.skill);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accent.withOpacity(0.3), width: 1),
      ),
      child: Text(
        skill,
        style: const TextStyle(
          color: AppColors.primaryText,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
