
///ExpandListModel  的子model
class ExpandItemModel {
  int itemId;
  String? itemTitle;
  bool? showCheckBox = false;
  String? itemIcon;
  String? itemNetIcon;
  bool? showIcon;
  dynamic data; //额外数据
  bool? showLine;

  ExpandItemModel({
    required this.itemTitle,
    this.itemIcon,
    this.showCheckBox,
    this.showIcon,
    this.itemNetIcon,
    required this.itemId,
    this.data,
    this.showLine,
  });

  @override
  String toString() {
    return 'ExpandItem{itemId: $itemId, itemTitle: $itemTitle, showCheckBox: $showCheckBox, itemIcon: $itemIcon, showIcon: $showIcon，data: $data}';
  }

}