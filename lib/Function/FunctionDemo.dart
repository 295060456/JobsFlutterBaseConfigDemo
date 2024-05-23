import 'dart:developer';

typedef MyBlock<T, R> = R Function(T);

// 一个接受整数并返回整数的函数
int addOne(int x) {
  return x + 1;
}

// 一个接受字符串并返回其长度的函数
int stringLength(String s) {
  return s.length;
}

void main() {
  // 使用 MyBlock<int, int> 类型的函数
  MyBlock<int, int> increment = addOne;
  log(increment(5).toString()); // 输出: 6
  
  // 使用 MyBlock<String, int> 类型的函数
  MyBlock<String, int> lengthGetter = stringLength;
  log(lengthGetter("Hello").toString()); // 输出: 5
}
