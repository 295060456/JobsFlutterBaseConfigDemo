import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:video_player/video_player.dart';
import '../../constant/app_themes.dart';
import '../../services/theme/theme_service.dart';
import '../../utils/function.dart';
import '../button/custom_icon_button.dart';


class CostomVideoPlay extends StatefulWidget {
  final ParamVoidCallback? onRemoveCallback;

  CostomVideoPlay({super.key, this.onRemoveCallback});

  @override
  State<StatefulWidget> createState() => _createVideoPlayState();

}

class _createVideoPlayState extends State<CostomVideoPlay> {
  late VideoPlayerController _videoPlayerController;
  // late ChewieController _chewieController;
  late Future<void> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse('http://vjs.zencdn.net/v/oceans.mp4'));
    // _chewieController = ChewieController(
    //   videoPlayerController: _videoPlayerController,
    //   aspectRatio: 16 / 9,
    //   autoPlay: true,
    //   looping: true,
    // );
    _future = _videoPlayerController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
              color: ThemeService().theme.colorScheme.background,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: AppValues.defaultMargin,),
                CustomIconButton(
                  padding: 0,
                  widgetWidth: 20,
                  widgetHeight: 20,
                  iconWidth: 16,
                  iconHeight: 16,
                  iconWidget: Image.asset(
                    'assets/images/sport/sport_video.webp',
                    width: 14,
                    height: 14,
                  ),
                  onTap: () {

                  },
                ),
                SizedBox(width: AppValues.margin_4,),
                Text(S.current.random_text_729,
                  style: TextStyle(color: Colors.white, fontSize: 14),),
                SizedBox(width: AppValues.margin_12,),
                CustomIconButton(
                  padding: 0,
                  widgetWidth: 20,
                  widgetHeight: 20,
                  iconWidth: 16,
                  iconHeight: 16,
                  iconWidget: Image.asset(
                    'assets/images/sport/sport_more.webp',
                    width: 14,
                    height: 14,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: AppValues.margin_4,),
                Text(S.current.random_text_730,
                  style: TextStyle(color: Colors.white, fontSize: 14),),
                Expanded(child: SizedBox()),
                CustomIconButton(
                  padding: 0,
                  widgetWidth: 20,
                  widgetHeight: 20,
                  iconWidth: 16,
                  iconHeight: 16,
                  iconWidget: Image.asset(
                    'assets/images/bet_slip/ic_float_view_max.webp',
                    width: 14,
                    height: 14,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: AppValues.margin_12,),
                InkWell(
                    onTap: () {
                      widget.onRemoveCallback?.call();
                      _videoPlayerController.dispose();
                      // _chewieController.dispose();
                    },
                    child: Icon(Icons.close,color: AppThemes.iconColor,size: 18,)),
                SizedBox(width: AppValues.margin_12,),
              ],
            ),
          ),
          Container(
            color: AppThemes.floatViewColor,
            alignment: Alignment.topCenter,
            width: 300,
            height: 180,
            child: FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return VideoPlayer(
                    _videoPlayerController,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 300,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
              color: ThemeService().theme.colorScheme.tertiary,
            ),
            child: CustomText(''),
          ),
        ],
      ),
    );
  }

}
