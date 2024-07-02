# Flutter 项目靶场

[toc]

## 相关资料

* [**Flutter 项目的配置**](https://github.com/295060456/JobsFlutterBaseConfig/blob/main/README.md)
* [**Flutter 经验**](https://github.com/295060456/JobsFlutterBaseConfig/blob/main/FlutterDoc/FlutterDoc.md)
* [**Flutter.UI （系统控件及其相关常用属性/方法）**](https://github.com/295060456/JobsFlutterBaseConfig/blob/main/FlutterDoc/Flutter.UI%20%EF%BC%88%E7%B3%BB%E7%BB%9F%E6%8E%A7%E4%BB%B6%E5%8F%8A%E5%85%B6%E7%9B%B8%E5%85%B3%E5%B8%B8%E7%94%A8%E5%B1%9E%E6%80%A7%3A%E6%96%B9%E6%B3%95%EF%BC%89.md)
* [**LYM_Flutter_Demo**](https://github.com/295060456/LYM_Flutter_Demo)

## 项目文件（夹）功能

* `analysis_options.yaml` 是一个与 Dart 语言开发相关的文件，它通常用于配置 Dart 代码的静态分析和代码风格检查工具；
  
  ```yaml
  # This file configures the analyzer, which statically analyzes Dart code to
  # check for errors, warnings, and lints.
  #
  # The issues identified by the analyzer are surfaced in the UI of Dart-enabled
  # IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
  # invoked from the command line by running `flutter analyze`.
  
  # The following line activates a set of recommended lints for Flutter apps,
  # packages, and plugins designed to encourage good coding practices.
  analyzer:
    errors:
      # 警告忽略：在公共 API 中使用私有类型
      library_private_types_in_public_api: ignore
  include: package:flutter_lints/flutter.yaml
  
  linter:
    # The lint rules applied to this project can be customized in the
    # section below to disable rules from the `package:flutter_lints/flutter.yaml`
    # included above or to enable additional rules. A list of all available lints
    # and their documentation is published at https://dart.dev/lints.
    #
    # Instead of disabling a lint rule for the entire project in the
    # section below, it can also be suppressed for a single line of code
    # or a specific dart file by using the `// ignore: name_of_lint` and
    # `// ignore_for_file: name_of_lint` syntax on the line or in the file
    # producing the lint.
    rules:
      # avoid_print: false  # Uncomment to disable the `avoid_print` rule
      # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule
  
  # Additional information about this file can be found at
  # https://dart.dev/guides/language/analysis-options
  ```
  
  * 这个文件定义了一系列的规则和配置，以指导静态分析工具（如 Dart Analyzer）和代码风格检查工具（如 Dart Linter）在检查 Dart 代码时应该遵循的规范和行为。
  * 在这个文件中，可以配置许多不同的选项。比如：代码格式化规则、代码风格规范、代码质量检查规则等；
  * 这个文件可以帮助团队确保他们的 Dart 代码在语法、风格和质量方面都保持一致性，并且符合团队或项目的规范，确保团队的代码质量和一致性；
  * 一个典型的 `analysis_options.yaml` 文件可能包含诸如以下内容的配置：
    * 代码风格规范，比如缩进、空格使用、命名约定等；
    * 静态分析工具的配置，比如是否启用强类型检查、未使用的变量警告等；
    * 代码质量检查规则，比如未使用的代码、不安全的操作等；
    * 项目特定的规则和配置，比如禁用特定的警告、自定义代码格式化等；
  
* `pubspec.yaml` 是 Dart 语言中用于管理项目依赖和元数据的文件。这个文件通常位于 Dart 项目的根目录中，其中包含了项目的名称、版本、作者信息等基本元数据，以及项目所依赖的第三方库（通过 Dart 包管理器 pub 安装）；

  * 在这个文件中，你可以做以下几件事情：
    * **指定项目元数据**：你可以指定项目的名称、版本、描述、作者信息等元数据，这些信息将在发布到 Dart 包仓库时显示。
    * **定义项目依赖**：通过 `dependencies` 和 `dev_dependencies` 部分，你可以指定项目所依赖的第三方库。其中，`dependencies` 指定项目运行时依赖的库，而 `dev_dependencies` 则是开发时依赖的库，比如测试框架、代码分析工具等。
    * **指定 Dart 版本**：你可以指定项目所需的 Dart SDK 版本，以确保项目的兼容性。
    * **添加其他配置**：除了上述内容外，你还可以在 `pubspec.yaml` 文件中添加其他配置，比如项目的环境依赖、脚本命令、资源文件等。
  * <font color=red>`assets` **路径名不能有中文，否则可能无法正常读取**</font>

  *`pubspec.yaml`*

  ```yaml
  name: my_project
  version: 1.0.0
  description: A sample Dart project
  
  dependencies:
    flutter:
      sdk: flutter
    http: ^0.13.3
    intl: ^0.17.0
  
  dev_dependencies:
    flutter_test:
      sdk: flutter
  
  flutter:
    uses-material-design: true
    
  assets: # 路径名不能有中文，否则可能无法正常读取
    - assets/
    - assets/i18n/
    - assets/CarouselAssets/
    - assets/AppLaunchAssets/
  
  #这个文件定义了一个名为 `my_project` 的 Dart 项目
  #它依赖于 Flutter SDK
  #并且还依赖于 `http` 和 `intl` 这两个第三方库
  #同时，它也声明了开发时的依赖 `flutter_test`
  ```

* `pubspec.lock` 文件是 Dart 项目中的自动生成文件，用于锁定项目依赖的版本信息。

  * 是 Dart 项目中的重要文件之一，通常由 Dart 包管理器 pub 自动生成，并且会随着你运行 `pub get` 或 `pub upgrade` 命令而更新。
  * `pubspec.lock` 文件记录了项目依赖包的确切版本信息，包括主要依赖和间接依赖。这样做的目的是确保**在不同的环境中**（比如不同的开发者、不同的构建服务器）运行相同的 `pub get` 或 `pub upgrade` 命令时，使用的依赖版本都是一致的，从而避免因为依赖版本不一致而导致的问题，提高了项目的可重复性和稳定性；
  * 当运行 `pub get` 或 `pub upgrade` 命令时，pub 将会根据 `pubspec.yaml` 中指定的依赖关系生成或更新 `pubspec.lock` 文件；

  *`pubspec.lock`*

  ```yaml
  packages:
    flutter:
      description: flutter
      source: hosted
      version: "2.5.0"
    http:
      description: http
      source: hosted
      version: "0.13.3"
    intl:
      description: intl
      source: hosted
      version: "0.17.0"
  ```


* `.metadata` 文件是一个二进制文件，Dart 项目中的一个隐藏文件，通常存储在项目的根目录下，用于保存与 Dart 包管理器 pub 相关的元数据信息。

  * 这个文件通常由 pub 自动生成和维护，其中包含了一些关于项目的信息，比如项目所使用的 SDK 版本、缓存路径、依赖包的路径等；
  * 不需要手动编辑或处理 `.metadata` 文件，因为它是由 pub 自动生成和管理的；
  * 在一些情况下，你可能会发现自己需要删除 `.metadata` 文件，例如当你遇到与 pub 相关的问题时，尝试删除 `.metadata` 文件并重新执行 `pub get` 或 `pub upgrade` 可能会有助于解决问题；
  * 删除 `.metadata` 文件后，pub 会重新生成一个新的 `.metadata` 文件，其中包含了当前项目的元数据信息；

* `.flutter-plugins` 文件是 Flutter 项目中的一个隐藏文件，它用于跟踪 Flutter 插件的信息；

  * 是一个文本文件，通常使用 UTF-8 编码。只是一种简单的（键值对格式）配置文件格式，并没有特定的编程语言与之关联
  * 这个文件的存在使得 Flutter 工具能够轻松地知道项目中使用了哪些插件，以及它们的路径。这对于构建、编译和打包应用程序是非常有用的，因为 Flutter 工具需要知道哪些插件需要包含在最终的应用程序包中。
  * Flutter 插件是用来扩展 Flutter 应用程序功能的软件包，它们通常用于访问平台特定的功能，比如相机、地理位置、推送通知等；
  * 文件记录了项目中使用的 Flutter 插件的名称和路径信息。当你在 Flutter 项目中添加或移除 Flutter 插件时，Flutter 工具会自动更新这个文件；
  * 文件的格式通常是一个简单的键值对列表，其中键是插件的名称，值是插件所在的路径，如下所示：

  ```
  camera=plugins/camera/
  location=plugins/location/
  ```


* `.flutter-plugins-dependencies` 文件是一个用来存储 Flutter 插件依赖信息的隐藏文件；

  * 这个文件通常由 Flutter 工具自动生成和维护，并且在使用 `flutter pub get` 或 `flutter pub upgrade` 命令时会被更新；

  * 文件记录了每个 Flutter 插件的依赖关系，包括主要插件和依赖插件。这些信息有助于 Flutter 工具更好地管理插件及其依赖关系，并确保项目中使用的所有插件及其相关的依赖都被正确地下载和管理；

  *`.flutter-plugins-dependencies`*

  ```yaml
  dependencies:
    camera:
      dependency: "direct main"
      description:
        name: camera
        url: "https://pub.dev/packages/camera"
        version: "0.9.4+9"
    image_picker:
      dependency: "direct main"
      description:
        name: image_picker
        url: "https://pub.dev/packages/image_picker"
        version: "0.8.4+3"
        
  # 在这个示例中，`camera` 和 `image_picker` 是两个插件，它们分别有自己的依赖关系记录，包括依赖类型（`dependency`）、名称（`name`）、URL 和版本号。
  ```


* `.idea` 文件夹通常是 JetBrains 的集成开发环境（IDE）如 IntelliJ IDEA 或 Android Studio 在项目中生成的隐藏文件夹。这个文件夹中包含了与项目相关的配置文件、工程文件、模板文件等，**用于配置项目在 IDE 中的行为和外观**。

  在一个 Flutter 或 Dart 项目中，`.idea` 文件夹可能包含以下一些常见的文件和文件夹：

  * **workspace.xml**：保存了项目级别的工作区配置，比如编辑器的布局、窗口状态等。
  * **modules.xml**：包含了项目的模块信息，如果项目被分割成了多个模块，每个模块的配置信息都会在这个文件中。
  * **dart.xml** 或 **flutter.xml**：这些文件包含了与 Dart 或 Flutter 相关的配置信息，比如代码格式化规则、代码模板、SDK 路径等。
  * **libraries** 文件夹：保存了项目中使用的库的配置信息，比如 Dart SDK、Flutter SDK、第三方库等。
  * **inspectionProfiles** 文件夹：包含了代码检查和静态分析的配置文件，用于定义代码风格和质量检查的规则。
  * 其他可能的配置文件和文件夹，比如代码模板、文件模板、版本控制配置等。

  总的来说，`.idea` 文件夹是 JetBrains IDE 用于存储项目配置和元数据的文件夹，它通常不应该被版本控制系统跟踪，因为这些配置文件通常是特定于开发者的，并且可能会因为 IDE 版本的不同而有所变化。
