import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTypography {
  // Headings
  static TextStyle get h1 => GoogleFonts.outfit(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.1,
  );

  static TextStyle get h2 => GoogleFonts.outfit(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.2,
  );

  static TextStyle get h3 => GoogleFonts.outfit(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.2,
  );

  static TextStyle get h4 => GoogleFonts.outfit(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static TextStyle get h5 => GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static TextStyle get h6 => GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.4,
  );

  // Body text
  static TextStyle get bodyLarge => GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
    height: 1.6,
  );

  static TextStyle get bodyMedium => GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
    height: 1.6,
  );

  static TextStyle get bodySmall => GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
    height: 1.5,
  );

  // Secondary text variations
  static TextStyle get bodyLargeSecondary => GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.6,
  );

  static TextStyle get bodyMediumSecondary => GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.6,
  );

  static TextStyle get bodySmallSecondary => GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.5,
  );

  // Accent text
  static TextStyle get accent => GoogleFonts.outfit(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
    height: 1.2,
  );

  static TextStyle get accentMedium => GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
    height: 1.3,
  );

  static TextStyle get accentSmall => GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
    height: 1.4,
  );

  // Button text
  static TextStyle get button => GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.2,
  );

  static TextStyle get buttonSmall => GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.2,
  );

  // Caption and labels
  static TextStyle get caption => GoogleFonts.outfit(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.4,
  );

  static TextStyle get label => GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.4,
  );

  // Tagline/subtitle
  static TextStyle get tagline => GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.5,
  );

  // Mobile responsive variants
  static TextStyle get h1Mobile => GoogleFonts.outfit(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.2,
  );

  static TextStyle get h2Mobile => GoogleFonts.outfit(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static TextStyle get accentMobile => GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
    height: 1.3,
  );

  static TextStyle get taglineMobile => GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.5,
  );
}
