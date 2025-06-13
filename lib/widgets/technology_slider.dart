import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TechnologySlider extends StatefulWidget {
  const TechnologySlider({super.key});

  @override
  _TechnologySliderState createState() => _TechnologySliderState();
}

class _TechnologySliderState extends State<TechnologySlider>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentPage = 0;

  final List<Map<String, dynamic>> technologies = [
    {
      'name': 'Flutter',
      'color': const Color(0xFF02569B),
      'icon': Icons.flutter_dash,
    },
    {'name': 'Dart', 'color': const Color(0xFF0175C2), 'icon': Icons.code},
    {'name': 'Firebase', 'color': const Color(0xFFFFCA28), 'icon': Icons.cloud},
    {'name': 'Bloc', 'color': const Color(0xFF00D4FF), 'icon': Icons.widgets},
    {'name': 'Java', 'color': const Color(0xFFED8B00), 'icon': Icons.coffee},
    {'name': 'Git', 'color': const Color(0xFFF05032), 'icon': Icons.source},
    {'name': 'SQL', 'color': const Color(0xFF4479A1), 'icon': Icons.storage},
    {
      'name': 'Figma',
      'color': const Color(0xFFF24E1E),
      'icon': Icons.design_services,
    },
    {'name': 'Laravel', 'color': const Color(0xFFFF2D20), 'icon': Icons.web},
    {
      'name': 'Android Studio',
      'color': const Color(0xFF3DDC84),
      'icon': Icons.android,
    },
    {
      'name': 'VS Code',
      'color': const Color(0xFF007ACC),
      'icon': Icons.code_outlined,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: (technologies.length / 3).ceil(),
            itemBuilder: (context, pageIndex) {
              return _buildTechnologyPage(pageIndex);
            },
          ),
        ),
        const SizedBox(height: 20),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildTechnologyPage(int pageIndex) {
    final startIndex = pageIndex * 3;
    final endIndex = (startIndex + 3).clamp(0, technologies.length);
    final pageTechnologies = technologies.sublist(startIndex, endIndex);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: pageTechnologies
            .map((tech) => _buildTechnologyCard(tech))
            .toList(),
      ),
    );
  }

  Widget _buildTechnologyCard(Map<String, dynamic> tech) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + (_animationController.value * 0.1),
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: (tech['color'] as Color).withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: (tech['color'] as Color).withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  tech['icon'] as IconData,
                  size: 48,
                  color: tech['color'] as Color,
                ),
                const SizedBox(height: 12),
                Text(
                  tech['name'],
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        (technologies.length / 3).ceil(),
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? AppColors.accent
                : AppColors.accent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
