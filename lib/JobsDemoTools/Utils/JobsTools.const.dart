class JobsSizeSpec {
  final double w;
  final double h;

  const JobsSizeSpec({
    required this.w,
    required this.h,
  });

  /// 快捷方法：正方形
  const JobsSizeSpec.square(double size)
      : w = size,
        h = size;
}
