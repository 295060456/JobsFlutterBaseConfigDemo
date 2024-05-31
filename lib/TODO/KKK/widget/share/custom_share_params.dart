///分享配置
// https://www.facebook.com/sharer/sharer.php?u=
// https://api.whatsapp.com/send?text=
// https://t.me/share/url?url=
// https://twitter.com/intent/tweet?text%20&url=
enum ShareTypeEnum {
  Facebook(type: 1, baseShare: "https://www.facebook.com/sharer/sharer.php?u="),
  WhatsApp(type: 2, baseShare: "https://api.whatsapp.com/send?text="),
  Telegram(type: 3, baseShare: "https://t.me/share/url?url="),
  Twitter(type: 4, baseShare: "https://twitter.com/intent/tweet?text%20&url="),
  Gmail(type: 5, baseShare: "https://mailto:?subject="),
  Instagram(type: 6, baseShare: "https://www.instagram.com/"),
  YouTube(type: 7, baseShare: "https://www.youtube.com/"),
  TikTok(type: 8, baseShare: "https://www.tiktok.com?fromUrl=/"),
  LINE(type: 9, baseShare: "https://social-plugins.line.me/lineit/share?url=");

  final int type;
  final String baseShare; //基本地址

  const ShareTypeEnum({required this.type, required this.baseShare});
}
