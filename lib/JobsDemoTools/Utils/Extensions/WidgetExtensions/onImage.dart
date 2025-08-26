import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/Extensions/WidgetExtensions/onWidgets.dart';

/// 辅助：可选的 package 标记（避免直接把 String 用作 package 参数）
class Package {
  final String name;
  const Package(this.name);
}

extension JobsImageX on Widget {
  // 通用：直接传 ImageProvider（最灵活）
  JobsStyled bgImageProvider(
    ImageProvider provider, {
    BoxFit fit = BoxFit.cover,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    FilterQuality filterQuality = FilterQuality.low,
    // 你也可以继续加 colorFilter / opacity 等
  }) {
    return JobsStyled(child: this).bgImage(
      DecorationImage(
        image: provider,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        centerSlice: centerSlice,
        matchTextDirection: matchTextDirection,
        filterQuality: filterQuality,
      ),
    );
  }
}

/// ================================== 仅传 Asset 路径 ==================================
extension JobsImageByAsset on Widget {
  JobsStyled imageByAsset(
    String asset, {
    required BoxFit fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Package? pkg, // 如果有多 package 资源，可传 package 名
  }) {
    return bgImageProvider(AssetImage(asset, package: pkg?.name),
        fit: fit, alignment: alignment, repeat: repeat);
  }

  JobsStyled imageByAssetaOnFill(
    String asset, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Package? pkg, // 如果有多 package 资源，可传 package 名
  }) =>
      imageByAsset(asset,
          fit: BoxFit.fill, alignment: alignment, repeat: repeat, pkg: pkg);

  JobsStyled imageByAssetaOnContain(
    String asset, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Package? pkg, // 如果有多 package 资源，可传 package 名
  }) =>
      imageByAsset(asset,
          fit: BoxFit.contain, alignment: alignment, repeat: repeat, pkg: pkg);

  JobsStyled imageByAssetaOnCover(
    String asset, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Package? pkg, // 如果有多 package 资源，可传 package 名
  }) =>
      imageByAsset(asset,
          fit: BoxFit.cover, alignment: alignment, repeat: repeat, pkg: pkg);

  JobsStyled imageByAssetaOnFitWidth(
    String asset, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Package? pkg, // 如果有多 package 资源，可传 package 名
  }) =>
      imageByAsset(asset,
          fit: BoxFit.fitWidth, alignment: alignment, repeat: repeat, pkg: pkg);

  JobsStyled imageByAssetaOnFitHeight(
    String asset, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Package? pkg, // 如果有多 package 资源，可传 package 名
  }) =>
      imageByAsset(asset,
          fit: BoxFit.fitHeight,
          alignment: alignment,
          repeat: repeat,
          pkg: pkg);

  JobsStyled imageByAssetaOnNone(
    String asset, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Package? pkg, // 如果有多 package 资源，可传 package 名
  }) =>
      imageByAsset(asset,
          fit: BoxFit.none, alignment: alignment, repeat: repeat, pkg: pkg);

  JobsStyled imageByAssetaOnScaleDown(
    String asset, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Package? pkg, // 如果有多 package 资源，可传 package 名
  }) =>
      imageByAsset(asset,
          fit: BoxFit.scaleDown,
          alignment: alignment,
          repeat: repeat,
          pkg: pkg);
}

/// ================================== 仅传 Network URL ==================================
extension JobsImageByNetwork on Widget {
  JobsStyled imageByNetwork(
    String url, {
    required BoxFit fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Map<String, String>? headers,
  }) {
    return bgImageProvider(NetworkImage(url, headers: headers),
        fit: fit, alignment: alignment, repeat: repeat);
  }

  JobsStyled imageByNetworkOnFill(
    String url, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Map<String, String>? headers,
  }) =>
      imageByNetwork(url,
          fit: BoxFit.fill,
          alignment: alignment,
          repeat: repeat,
          headers: headers);

  JobsStyled imageByNetworkOnContain(
    String url, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Map<String, String>? headers,
  }) =>
      imageByNetwork(url,
          fit: BoxFit.contain,
          alignment: alignment,
          repeat: repeat,
          headers: headers);

  JobsStyled imageByNetworkOnCover(
    String url, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Map<String, String>? headers,
  }) =>
      imageByNetwork(url,
          fit: BoxFit.cover,
          alignment: alignment,
          repeat: repeat,
          headers: headers);

  JobsStyled imageByNetworkOnFitWidth(
    String url, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Map<String, String>? headers,
  }) =>
      imageByNetwork(url,
          fit: BoxFit.fitWidth,
          alignment: alignment,
          repeat: repeat,
          headers: headers);

  JobsStyled imageByNetworkOnFitHeight(
    String url, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Map<String, String>? headers,
  }) =>
      imageByNetwork(url,
          fit: BoxFit.fitHeight,
          alignment: alignment,
          repeat: repeat,
          headers: headers);

  JobsStyled imageByNetworkOnNone(
    String url, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Map<String, String>? headers,
  }) =>
      imageByNetwork(url,
          fit: BoxFit.none,
          alignment: alignment,
          repeat: repeat,
          headers: headers);

  JobsStyled imageByNetworkOnScaleDown(
    String url, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Map<String, String>? headers,
  }) =>
      imageByNetwork(url,
          fit: BoxFit.scaleDown,
          alignment: alignment,
          repeat: repeat,
          headers: headers);
}

/// ================================== 仅传内存字节 ==================================
extension JobsImageByMemory on Widget {
  JobsStyled imageByMemory(
    Uint8List bytes, {
    required BoxFit fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) {
    return bgImageProvider(MemoryImage(bytes),
        fit: fit, alignment: alignment, repeat: repeat);
  }

  JobsStyled imageByMemoryOnFill(
    Uint8List bytes, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) =>
      imageByMemory(bytes,
          fit: BoxFit.fill, alignment: alignment, repeat: repeat);

  JobsStyled imageByMemoryOnContain(
    Uint8List bytes, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) =>
      imageByMemory(bytes,
          fit: BoxFit.contain, alignment: alignment, repeat: repeat);

  JobsStyled imageByMemoryOnCover(
    Uint8List bytes, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) =>
      imageByMemory(bytes,
          fit: BoxFit.cover, alignment: alignment, repeat: repeat);

  JobsStyled imageByMemoryOnFitWidth(
    Uint8List bytes, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) =>
      imageByMemory(bytes,
          fit: BoxFit.fitWidth, alignment: alignment, repeat: repeat);

  JobsStyled imageByMemoryOnFitHeight(
    Uint8List bytes, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) =>
      imageByMemory(bytes,
          fit: BoxFit.fitHeight, alignment: alignment, repeat: repeat);

  JobsStyled imageByMemoryOnNone(
    Uint8List bytes, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) =>
      imageByMemory(bytes,
          fit: BoxFit.none, alignment: alignment, repeat: repeat);

  JobsStyled imageByMemoryOnScaleDown(
    Uint8List bytes, {
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) =>
      imageByMemory(bytes,
          fit: BoxFit.scaleDown, alignment: alignment, repeat: repeat);
}
