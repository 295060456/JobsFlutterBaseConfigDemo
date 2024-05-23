
// 判断两个集合是否相等
Set<dynamic> set1 = {"USD", "EUR", "GBP"};
Set<dynamic> set2 = {"USD", "EUR", "GBP", "JPY"};
// ignore: non_constant_identifier_names
bool OK = set1.containsAll(set2) && set2.containsAll(set1);

typedef InstanceBuilderCallback<S> = S Function();

// Get.lazyPut
// Get.find