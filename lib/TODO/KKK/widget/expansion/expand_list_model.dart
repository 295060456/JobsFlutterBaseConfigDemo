import 'expand_item_model.dart';

class ExpandListModel {
  int value;
  String headTitle;
  String? headIcon; //网络失败会加载该图片
  String? headNetIcon;
  bool? isOpen = false;
  bool showRadio = false;
  bool? showIcon = false;
  List<ExpandItemModel>? item;

  ExpandListModel(
      {required this.value,
      required this.headTitle,
      this.headIcon,
      this.headNetIcon,
      this.isOpen,
      required this.item,
      required this.showRadio,
      this.showIcon});

  @override
  String toString() {
    return 'ExpandListModel{value: $value, headTitle: $headTitle, headIcon: $headIcon, headNetIcon: $headNetIcon, isOpen: $isOpen, showRadio: $showRadio, showIcon: $showIcon}';
  }
}


