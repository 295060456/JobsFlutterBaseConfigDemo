import 'package:flutter/material.dart';

class CustomSportExpandController extends ChangeNotifier {
  bool _isExpanded;

  bool get isExpanded => _isExpanded;

  CustomSportExpandController({
    bool isExpanded = false,
  }) : _isExpanded = isExpanded;

  // Expand the content
  void expand() {
    _isExpanded = true;
    notifyListeners();
  }

  // Collapse the content
  void collapse() {
    _isExpanded = false;
    notifyListeners();
  }

  // Toggle between expanded and collapsed states
  void toggle() {
    _isExpanded = !isExpanded;
    notifyListeners();
  }
}
