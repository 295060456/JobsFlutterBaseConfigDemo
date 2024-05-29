import 'package:flutter_bet/constant/app_cache_key.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/utils/sp_util.dart';

class ChatRoomService {
  // 如果一个函数的构造方法并不总是返回一个新的对象的时候，可以使用factory，
  // 比如从缓存中获取一个实例并返回或者返回一个子类型的实例

  // 工厂方法构造函数
  factory ChatRoomService() => _getInstance();

  // instance的getter方法，通过AccountService.instance获取对象
  static ChatRoomService get sharedInstance => _getInstance();

  // 静态变量_instance，存储唯一对象
  static ChatRoomService? _instance;

  // 获取对象
  static ChatRoomService _getInstance() {
    _instance ??= ChatRoomService._internal();
    return _instance!;
  }

  // 私有的命名式构造方法，通过它可以实现一个类可以有多个构造函数，
  // 子类不能继承internal不是关键字，可定义其他名字
  ChatRoomService._internal() {
    // 初始化
    init();
  }

  late ChatRoomChannelModel _channel;
  late ChatRoomChannelModel _oldChannel;

  final listeners = <ChatRoomServiceListener>[];

  init() {
    final channels = getChannelModels;
    // _channel = channels[0];
    _oldChannel = channels[0];
    // ///1：中文 2:英语 7:葡萄牙语 8:越南语
    int langType = SPUtil().getInt(CacheKey.langType) ?? 1;
    if(langType == 1) {
      _channel = channels[1];
    }else if(langType == 4) {
      _channel = channels[2];
    }else if(langType == 3) {
      _channel = channels[3];
    }else if(langType == 5) {
      _channel = channels[5];
    }else{
      _channel = channels[0];
    }
  }

  ChatRoomChannelModel get getChannel {
    return _channel;
  }

  void switchChannel(ChatRoomChannelModel channel) {
    if (channel == _oldChannel) return;
    _oldChannel = _channel;
    _channel = channel;
    for (ChatRoomServiceListener listener in listeners) {
      if (listener.onChannelChange != null) {
        listener.onChannelChange!(_oldChannel, _channel);
      }
    }
  }

  List<ChatRoomChannelModel> get getChannelModels {
    final prefix = AppValues.defaultBranch.ws_prefix;
    return [
      ChatRoomChannelModel('English', '$prefix/chat/en_US', 'en_US','assets/images/chat_room/channel/ic_english.png'),
      ChatRoomChannelModel('中文', '$prefix/chat/zh_CN', 'zh_CN','assets/images/chat_room/channel/ic_cn.png'),
      ChatRoomChannelModel('Tiếng Việt', '$prefix/chat/vi_VN', 'vi_VN','assets/images/chat_room/channel/ic_vn.png'),
      ChatRoomChannelModel('Português', '$prefix/chat/pt_BR', 'pt_BR','assets/images/chat_room/channel/ic_br.png'),
      ChatRoomChannelModel('India', '$prefix/chat/hi_IN', 'hi_IN','assets/images/chat_room/channel/ic_in.png'),
      ChatRoomChannelModel('ประเทศไทย', '$prefix/chat/th_TH', 'th_TH','assets/images/chat_room/channel/ic_th.png'),
    ];
  }

  Future<void> addListener(ChatRoomServiceListener listener) async {
    if (listeners.contains(listener)) return;
    listeners.add(listener);
  }

  Future<void> removeListener(ChatRoomServiceListener listener) async {
    if (!listeners.contains(listener)) return;
    listeners.remove(listener);
  }
}

class ChatRoomChannelModel {
  final String name;
  final String topicName;
  final String lang;
  final String iconPath;

  ChatRoomChannelModel(this.name, this.topicName, this.lang,this.iconPath);
}

typedef ChatRoomServiceListenerOnChannelChange = void Function(
    ChatRoomChannelModel oldChannel, ChatRoomChannelModel newChannel);

class ChatRoomServiceListener {
  ChatRoomServiceListenerOnChannelChange? onChannelChange;

  ChatRoomServiceListener({
    this.onChannelChange,
  });
}
