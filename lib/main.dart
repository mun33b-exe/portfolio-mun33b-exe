import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/colors.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/education_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';
import 'widgets/navigation.dart';
import 'widgets/mobile_navigation.dart';
import 'widgets/common_widgets.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.background,
        textTheme:
            GoogleFonts.outfitTextTheme(
              Theme.of(context).textTheme.apply(
                bodyColor: AppColors.primaryText,
                displayColor: AppColors.primaryText,
              ),
            ).copyWith(
              bodyLarge: GoogleFonts.outfit(color: AppColors.primaryText),
              bodyMedium: GoogleFonts.outfit(color: AppColors.secondaryText),
              headlineLarge: GoogleFonts.outfit(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: GoogleFonts.outfit(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: GoogleFonts.outfit(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: GoogleFonts.outfit(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
              ),
              titleMedium: GoogleFonts.outfit(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
              ),
              titleSmall: GoogleFonts.outfit(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
              ),
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accent,
          brightness: Brightness.dark,
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final NavigationService _navigationService = NavigationService();
  // Section keys for navigation
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _navigationService.initialize(_scrollController);
    _navigationService.registerSection('hero', _heroKey);
    _navigationService.registerSection('about', _aboutKey);
    _navigationService.registerSection('experience', _experienceKey);
    _navigationService.registerSection('education', _educationKey);
    _navigationService.registerSection('projects', _projectsKey);
    _navigationService.registerSection('contact', _contactKey);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _navigationService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: ResponsiveWidget.isMobile(context)
          ? const MobileNavigation()
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(key: _heroKey),
            AboutSection(key: _aboutKey),
            ExperienceSection(key: _experienceKey),
            EducationSection(key: _educationKey),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactKey),
            const Footer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigationService.scrollToTop(),
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.arrow_upward, color: AppColors.primaryText),
      ),
    );
  }
}
