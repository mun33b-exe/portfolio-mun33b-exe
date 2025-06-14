import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/app_constants.dart';
import '../widgets/common_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 768 ? 16.0 : 24.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ResponsiveWidget(
            mobile: const _MobileAbout(),
            tablet: const _TabletAbout(),
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
              const Text(
                "Technologies I Work With",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 24),
              _TechnologyGrid(),
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

class _TabletAbout extends StatelessWidget {
  const _TabletAbout();

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
            fontSize: 17,
            color: AppColors.secondaryText,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Technologies I Work With",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _TechnologyGrid(),
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Skills & Technologies",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _SkillsGrid(),
                ],
              ),
            ),
          ],
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
        const Text(
          "Technologies I Work With",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 24),
        _TechnologyGrid(),
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

class _TechnologyGrid extends StatelessWidget {
  final List<Map<String, dynamic>> technologies = [
    {'name': 'Flutter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'name': 'Dart', 'icon': Icons.code, 'color': Colors.blue.shade700},
    {
      'name': 'Firebase',
      'icon': Icons.local_fire_department,
      'color': Colors.orange,
    },
    {'name': 'Bloc', 'icon': Icons.architecture, 'color': Colors.purple},
    {'name': 'Java', 'icon': Icons.coffee, 'color': Colors.red.shade800},
    {'name': 'Git', 'icon': Icons.source, 'color': Colors.orange.shade700},
    {'name': 'SQL', 'icon': Icons.storage, 'color': Colors.blue.shade600},
    {'name': 'Figma', 'icon': Icons.design_services, 'color': Colors.pink},
    {'name': 'Laravel', 'icon': Icons.web, 'color': Colors.red.shade600},
    {'name': 'Android Studio', 'icon': Icons.android, 'color': Colors.green},
    {
      'name': 'VS Code',
      'icon': Icons.code_outlined,
      'color': Colors.blue.shade500,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isMobile(context)
        ? _buildMobileGrid()
        : _buildDesktopGrid();
  }

  Widget _buildDesktopGrid() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: technologies
          .map(
            (tech) => _TechnologyItem(
              name: tech['name'],
              icon: tech['icon'],
              color: tech['color'],
              size: 48,
            ),
          )
          .toList(),
    );
  }

  Widget _buildMobileGrid() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: technologies
          .map(
            (tech) => _TechnologyItem(
              name: tech['name'],
              icon: tech['icon'],
              color: tech['color'],
              size: 40,
            ),
          )
          .toList(),
    );
  }
}

class _TechnologyItem extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color color;
  final double size;

  const _TechnologyItem({
    required this.name,
    required this.icon,
    required this.color,
    required this.size,
  });

  @override
  State<_TechnologyItem> createState() => _TechnologyItemState();
}

class _TechnologyItemState extends State<_TechnologyItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: widget.size + 16,
              height: widget.size + 16,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: widget.color.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(widget.icon, size: widget.size, color: widget.color),
            ),
            const SizedBox(height: 8),
            Text(
              widget.name,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
