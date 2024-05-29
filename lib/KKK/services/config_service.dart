import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../package_config.dart';

enum ProjectType {
  project1,
  project2,
  project3,
  project4,
  project5,
  project6,
}

class AppConfigService {
  AppConfigService._();

  static AppConfigService? _instance;

  static AppConfigService _getInstance() {
    _instance ??= AppConfigService._();
    return _instance!;
  }

  static AppConfigService get instance => _getInstance();

  factory AppConfigService() => _getInstance();

  ProjectType getProjectType() {

    switch (project_number) {
      case '1':
        return ProjectType.project1;
      case '2':
        return ProjectType.project2;
      case '3':
        return ProjectType.project3;
      case '4':
        return ProjectType.project4;
      case '5':
        return ProjectType.project5;
      default:
        return ProjectType.project1;
    }
  }

}
