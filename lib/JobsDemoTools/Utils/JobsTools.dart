import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/JobsTools.const.dart';

// Future<DecorationImage> svgAssetBy(String asset, {JobsSizeSpec? size}) async {
//     size = size ?? const JobsSizeSpec(w: 24, h: 24);

//     final PictureInfo pictureInfo = await vg.loadPicture(
//       SvgAssetLoader(asset),
//       null,
//     );
//     final ui.Image image = await pictureInfo.picture.toImage(
//       size.w.toInt(),
//       size.h.toInt(),
//     );
//     final ByteData? byteData =
//         await image.toByteData(format: ui.ImageByteFormat.png);

//     return DecorationImage(
//       image: MemoryImage(byteData!.buffer.asUint8List()),
//       fit: BoxFit.contain,
//     );
//   }
