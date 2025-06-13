import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/app_constants.dart';
import '../widgets/common_widgets.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: "Experience",
                subtitle: "My professional journey",
              ),
              ResponsiveWidget(
                mobile: _MobileExperience(),
                desktop: _DesktopExperience(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppConstants.experience.map((exp) {
        int index = AppConstants.experience.indexOf(exp);
        return Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline
              Column(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (index < AppConstants.experience.length - 1)
                    Container(
                      width: 2,
                      height: 120,
                      color: AppColors.accent.withOpacity(0.3),
                    ),
                ],
              ),
              const SizedBox(width: 24),
              // Content
              Expanded(
                child: GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exp["title"]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              exp["duration"]!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        exp["company"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        exp["description"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryText,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _MobileExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppConstants.experience.map((exp) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exp["title"]!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            exp["company"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        exp["duration"]!,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  exp["description"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
