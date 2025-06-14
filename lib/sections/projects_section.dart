import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/app_constants.dart';
import '../widgets/common_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});
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
                title: "Featured Projects",
                subtitle: "Some of my recent work",
              ),
              ResponsiveWidget(
                mobile: _MobileProjects(),
                tablet: _TabletProjects(), // Add tablet layout
                desktop: _DesktopProjects(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate responsive aspect ratio based on screen width
    double aspectRatio;
    int crossAxisCount;
    double spacing;

    if (screenWidth > 1600) {
      aspectRatio = 1.3; // Ultra-wide screens - better proportions
      crossAxisCount = 2;
      spacing = 32;
    } else if (screenWidth > 1400) {
      aspectRatio = 1.25; // Large screens - slightly taller
      crossAxisCount = 2;
      spacing = 28;
    } else if (screenWidth > 1200) {
      aspectRatio = 1.2; // Medium screens - good balance
      crossAxisCount = 2;
      spacing = 24;
    } else if (screenWidth > 1024) {
      aspectRatio = 1.15; // Smaller desktop screens - prevent too tall cards
      crossAxisCount = 2;
      spacing = 20;
    } else {
      aspectRatio = 1.4; // Tablet range - wider cards to prevent tallness
      crossAxisCount = 1;
      spacing = 16;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: aspectRatio,
      ),
      itemCount: AppConstants.projects.length,
      itemBuilder: (context, index) {
        final project = AppConstants.projects[index];
        return _ProjectCard(project: project);
      },
    );
  }
}

class _TabletProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust aspect ratio based on tablet screen width
    double aspectRatio;
    if (screenWidth > 900) {
      aspectRatio = 1.6; // Wider tablets
    } else {
      aspectRatio = 1.4; // Smaller tablets
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // Single column for tablet
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: aspectRatio, // Better proportions for tablet
      ),
      itemCount: AppConstants.projects.length,
      itemBuilder: (context, index) {
        final project = AppConstants.projects[index];
        return _ProjectCard(project: project);
      },
    );
  }
}

class _MobileProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppConstants.projects.map((project) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _ProjectCard(project: project),
        );
      }).toList(),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveWidget.isMobile(context);
    final isTablet = ResponsiveWidget.isTablet(context);

    // Calculate responsive image height based on breakpoints
    double imageHeight;
    double cardPadding;
    double titleFontSize;
    double descriptionFontSize;
    int maxDescriptionLines;

    if (isMobile) {
      imageHeight = 180; // Mobile gets consistent height
      cardPadding = 16;
      titleFontSize = 18;
      descriptionFontSize = 14;
      maxDescriptionLines = 3;
    } else if (isTablet) {
      imageHeight = 200; // Tablet size - increased for better proportion
      cardPadding = 18;
      titleFontSize = 20;
      descriptionFontSize = 14;
      maxDescriptionLines = 3;
    } else if (screenWidth > 1600) {
      imageHeight = 220; // Ultra-wide screens
      cardPadding = 24;
      titleFontSize = 22;
      descriptionFontSize = 15;
      maxDescriptionLines = 3;
    } else if (screenWidth > 1400) {
      imageHeight = 200; // Large screens
      cardPadding = 20;
      titleFontSize = 20;
      descriptionFontSize = 14;
      maxDescriptionLines = 3;
    } else if (screenWidth > 1200) {
      imageHeight = 180; // Medium screens
      cardPadding = 18;
      titleFontSize = 18;
      descriptionFontSize = 13;
      maxDescriptionLines = 2;
    } else if (screenWidth > 1024) {
      imageHeight = 160; // Small desktop
      cardPadding = 16;
      titleFontSize = 17;
      descriptionFontSize = 13;
      maxDescriptionLines = 2;
    } else {
      imageHeight = 180; // Very small screens
      cardPadding = 16;
      titleFontSize = 18;
      descriptionFontSize = 14;
      maxDescriptionLines = 3;
    }

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
              padding: EdgeInsets.all(cardPadding), // Use responsive padding
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: imageHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.accent.withOpacity(0.1),
                            AppColors.accent.withOpacity(0.05),
                          ],
                        ),
                        border: Border.all(
                          color: AppColors.accent.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child:
                          widget.project["image"] != null &&
                              widget.project["image"].toString().isNotEmpty
                          ? Image.asset(
                              widget.project["image"],
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              errorBuilder: (context, error, stackTrace) {
                                return _buildProjectPlaceholder();
                              },
                            )
                          : _buildProjectPlaceholder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Project Title
                  Text(
                    widget.project["title"] ?? "",
                    style: TextStyle(
                      fontSize: titleFontSize, // Use responsive font size
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                    maxLines: isMobile ? 2 : 1, // More lines on mobile
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Project Description
                  Text(
                    widget.project["description"] ?? "",
                    style: TextStyle(
                      fontSize: descriptionFontSize, // Use responsive font size
                      color: AppColors.secondaryText,
                      height: 1.3,
                    ),
                    maxLines: maxDescriptionLines, // Use responsive max lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Technologies
                  if (widget.project["technologies"] != null)
                    Wrap(
                      spacing: 4,
                      runSpacing: 3,
                      children: (widget.project["technologies"] as List<String>)
                          .take(
                            isMobile || isTablet ? 4 : 3,
                          ) // Show more on mobile/tablet
                          .map((tech) => _TechChip(tech))
                          .toList(),
                    ),
                  SizedBox(
                    height: isMobile || isTablet ? 12 : 10,
                  ), // More space on mobile/tablet                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () =>
                              _launchUrl(widget.project["github"] ?? ""),
                          icon: Image.asset(
                            'assets/images/github.png',
                            width: isMobile || isTablet ? 16 : 14,
                            height: isMobile || isTablet ? 16 : 14,
                            color: AppColors.accent,
                          ),
                          label: Text(
                            "Code",
                            style: TextStyle(
                              fontSize: isMobile || isTablet ? 13 : 12,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.accent,
                            side: const BorderSide(color: AppColors.accent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile || isTablet ? 12 : 8,
                              vertical: isMobile || isTablet ? 8 : 4,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              _launchUrl(widget.project["demo"] ?? ""),
                          icon: Icon(
                            Icons.launch,
                            size: isMobile || isTablet ? 16 : 14,
                          ),
                          label: Text(
                            "Demo",
                            style: TextStyle(
                              fontSize: isMobile || isTablet ? 13 : 12,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: AppColors.primaryText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile || isTablet ? 12 : 8,
                              vertical: isMobile || isTablet ? 8 : 4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectPlaceholder() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent.withOpacity(0.15),
            AppColors.accent.withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.web, size: 40, color: AppColors.accent.withOpacity(0.7)),
          const SizedBox(height: 8),
          Text(
            'Project Screenshot',
            style: TextStyle(
              color: AppColors.accent.withOpacity(0.7),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Coming Soon',
            style: TextStyle(
              color: AppColors.accent.withOpacity(0.5),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String tech;

  const _TechChip(this.tech);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    final isTablet = ResponsiveWidget.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile || isTablet ? 8 : 6,
        vertical: isMobile || isTablet ? 3 : 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tech,
        style: TextStyle(
          fontSize: isMobile || isTablet ? 11 : 10,
          color: AppColors.accent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    print('Could not launch $url');
  }
}
