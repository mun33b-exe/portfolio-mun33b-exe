import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  ScrollController? _scrollController;
  final Map<String, GlobalKey> _sectionKeys = {};
  final ValueNotifier<String> _currentSection = ValueNotifier<String>('hero');

  ValueNotifier<String> get currentSectionNotifier => _currentSection;
  void initialize(ScrollController scrollController) {
    _scrollController = scrollController;
    _scrollController!.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController == null || !_scrollController!.hasClients) return;

    final scrollOffset = _scrollController!.offset;
    String newSection = 'hero';

    // Check which section is currently visible
    for (final entry in _sectionKeys.entries) {
      final key = entry.value;
      final sectionName = entry.key;

      if (key.currentContext != null) {
        final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          final sectionTop = scrollOffset + position.dy - kToolbarHeight;

          // If we've scrolled past this section, it's potentially the current one
          if (scrollOffset >= sectionTop - 100) {
            // 100px offset for better UX
            newSection = sectionName;
          }
        }
      }
    }

    if (_currentSection.value != newSection) {
      _currentSection.value = newSection;
    }
  }

  void registerSection(String sectionName, GlobalKey key) {
    _sectionKeys[sectionName] = key;
  }

  GlobalKey? getSectionKey(String sectionName) {
    return _sectionKeys[sectionName];
  }

  Future<void> scrollToSection(String sectionName) async {
    if (_scrollController == null || !_scrollController!.hasClients) return;

    final key = _sectionKeys[sectionName];
    if (key == null || key.currentContext == null) return;

    try {
      final context = key.currentContext!;
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox == null) return;

      final position = renderBox.localToGlobal(Offset.zero);

      // Calculate the scroll position, accounting for the app bar height
      final targetPosition =
          _scrollController!.offset + position.dy - kToolbarHeight - 20;

      await _scrollController!.animateTo(
        targetPosition.clamp(0.0, _scrollController!.position.maxScrollExtent),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubic,
      );
    } catch (e) {
      print('Navigation error: $e');
    }
  }

  Future<void> scrollToTop() async {
    if (_scrollController == null) return;

    await _scrollController!.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void dispose() {
    _scrollController?.removeListener(_onScroll);
    _currentSection.dispose();
  }
}
