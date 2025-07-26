/// 判断一个字符串是不是 图片链接或图片路径
extension StringExtension on String {
  bool isImageUrl() {
    final RegExp imagePattern =
        RegExp(r'\.(jpg|jpeg|png|gif|bmp|webp|svg)$', caseSensitive: false);
    return imagePattern.hasMatch(this);
  }
}

/// 字符串拼接
extension StringAddExtension on String {
  String add(String suffix) => this + suffix;
}
