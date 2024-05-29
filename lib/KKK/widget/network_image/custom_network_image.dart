import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'custom_network_image_placeholder.dart';

class CustomNetWorkImage extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;
  final String imageUrl;
  final BoxBorder? border;
  final Widget? placeholder;
  final Widget? errorWidget;
  final bool showErrorMsg; //默认显示；是否显示错误提示，小图标就不要显示了；

  const CustomNetWorkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = AppValues.smallRadius,
    this.fit = BoxFit.cover,
    this.border,
    this.placeholder,
    this.errorWidget,
    this.showErrorMsg = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final borderRadius =
        radius != null ? BorderRadius.all(Radius.circular(radius!)) : null;
    // return CustomNetWorkImagePlaceholder(
    //     borderRadius: borderRadius,
    //     placeholderType: NetWorkImagePlaceholderType.loading);
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: border,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      // progressIndicatorBuilder: (context, url, downloadProgress) =>
      //     placeholder ??
      //     CustomNetWorkImagePlaceholder(
      //       placeholderType: NetWorkImagePlaceholderType.loading,
      //       borderRadius: borderRadius,
      //       border: border,
      //     ),
      placeholder: (context, url) =>
          placeholder ??
          CustomNetWorkImagePlaceholder(
            placeholderType: NetWorkImagePlaceholderType.loading,
            borderRadius: borderRadius,
            border: border,
            showMsg: showErrorMsg,
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          CustomNetWorkImagePlaceholder(
            placeholderType: NetWorkImagePlaceholderType.error,
            borderRadius: borderRadius,
            border: border,
            showMsg: showErrorMsg,
          ),
    );
  }

}
