import 'dart:ui';

//图片数据模型
class SportImageModel {
  SportImageType type;
  Image image;

  SportImageModel(this.type, this.image);
}


///图片类型枚举
enum SportImageType {
  add(1),//有加号标签
  upDown(2),//上下箭头
  football(3),//足球标签
  yellowCard(4),//换牌标签
  pointStroke(5),//空心
  pointFill(6);//实心


  final int type;
  const SportImageType(this.type);
}
