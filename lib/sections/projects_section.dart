import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/app_constants.dart';
import '../widgets/common_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
      aspectRatio = 1.4; // Ultra-wide screens
      crossAxisCount = 2;
      spacing = 32;
    } else if (screenWidth > 1400) {
      aspectRatio = 1.2; // Large screens
      crossAxisCount = 2;
      spacing = 32;
    } else if (screenWidth > 1200) {
      aspectRatio = 1.0; // Medium screens
      crossAxisCount = 2;
      spacing = 24;
    } else if (screenWidth > 1024) {
      aspectRatio = 0.9; // Smaller desktop screens
      crossAxisCount = 2;
      spacing = 20;
    } else {
      aspectRatio = 0.8; // Very small desktop/tablet
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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // Single column for tablet
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5, // Wider cards for tablet
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

    if (isMobile) {
      imageHeight = 200; // Mobile gets consistent height
      cardPadding = 16;
    } else if (isTablet) {
      imageHeight = 180; // Tablet size
      cardPadding = 16;
    } else if (screenWidth > 1600) {
      imageHeight = 200; // Ultra-wide screens
      cardPadding = 20;
    } else if (screenWidth > 1400) {
      imageHeight = 180; // Large screens
      cardPadding = 18;
    } else if (screenWidth > 1200) {
      imageHeight = 160; // Medium screens
      cardPadding = 16;
    } else if (screenWidth > 1024) {
      imageHeight = 150; // Small desktop
      cardPadding = 16;
    } else {
      imageHeight = 140; // Very small screens
      cardPadding = 12;
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
                      color: AppColors.card,
                      padding: EdgeInsets.all(
                        screenWidth < 1024 ? 4 : 8,
                      ), // Responsive padding
                      child:
                          widget.project["image"] != null &&
                              widget.project["image"].toString().isNotEmpty
                          ? Image.asset(
                              widget.project["image"],
                              fit: BoxFit
                                  .contain, // Use contain to preserve aspect ratio
                              alignment: Alignment.center,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 40,
                                    color: AppColors.accent,
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 40,
                                color: AppColors.accent,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Project Title
                  Text(
                    widget.project["title"] ?? "",
                    style: TextStyle(
                      fontSize: isMobile
                          ? 18
                          : (screenWidth > 1400
                                ? 18
                                : 16), // Responsive font size
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
                      fontSize: isMobile ? 14 : 13, // Slightly larger on mobile
                      color: AppColors.secondaryText,
                      height: 1.3,
                    ),
                    maxLines: isMobile ? 3 : 2, // More lines on mobile
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Technologies
                  if (widget.project["technologies"] != null)
                    Wrap(
                      spacing: 4,
                      runSpacing: 3,
                      children: (widget.project["technologies"] as List<String>)
                          .take(3)
                          .map((tech) => _TechChip(tech))
                          .toList(),
                    ),
                  const SizedBox(height: 10),
                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () =>
                              _launchUrl(widget.project["github"] ?? ""),
                          icon: Image.asset(
                            'assets/images/github.png',
                            width: 14,
                            height: 14,
                            color: AppColors.accent,
                          ),
                          label: const Text(
                            "Code",
                            style: TextStyle(fontSize: 12),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.accent,
                            side: const BorderSide(color: AppColors.accent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              _launchUrl(widget.project["demo"] ?? ""),
                          icon: const Icon(Icons.launch, size: 14),
                          label: const Text(
                            "Demo",
                            style: TextStyle(fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: AppColors.primaryText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
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
}

class _TechChip extends StatelessWidget {
  final String tech;

  const _TechChip(this.tech);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tech,
        style: const TextStyle(
          fontSize: 10,
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
