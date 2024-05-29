import 'dart:io';
import 'package:dio/dio.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';

typedef DownloadHandler = Future Function(num received, num total);
typedef DownloadFailedHandler = Future Function();
typedef InstalledHandler = Future Function();
typedef InstallFailedHandler = Future Function();

class ApkInstallService {
  ApkInstallService._();

  static ApkInstallService? _instance;

  static ApkInstallService _getInstance() {
    _instance ??= ApkInstallService._();
    return _instance!;
  }

  static ApkInstallService get instance => _getInstance();

  factory ApkInstallService() => _getInstance();

  DownloadHandler? _onDownload;
  DownloadFailedHandler? _onDownloadFailed;
  InstallFailedHandler? _onInstallFailed;
  InstalledHandler? _onInstalled;

  Future<void> downloadAndInstall(String url,
      {required DownloadHandler onDownload,
      required DownloadFailedHandler onDownloadFailed,
      required InstallFailedHandler onInstallFailed,
      required InstalledHandler onInstalled}) async {
    _onDownload = onDownload;
    _onInstalled = onInstalled;
    _onDownloadFailed = onDownloadFailed;
    _onInstallFailed = onInstallFailed;
    File? apkFile = await _downloadApk(url);
    if (apkFile is File) {
      print('--apk开始安装--path=${apkFile.path}');
      final res = await InstallPlugin.install(apkFile.path);
      print(
          "install apk ${res['isSuccess'] == true ? 'success' : 'fail:${res['errorMessage'] ?? ''}'}");
      if (res == true) {
        if (_onInstalled != null) _onInstalled!();
      } else {
        if (_onInstallFailed != null) _onInstallFailed!();
      }
    }
  }

  /// 下载安卓更新包
  Future<File?> _downloadApk(String url) async {
    Dio dio = Dio();
    var storageDir = await getExternalStorageDirectory();
    String storagePath = storageDir!.path;
    var file = File('$storagePath/app.apk');

    try {
      await dio.download(
        url,
        file.path,
        onReceiveProgress: (received, total) {
          if (_onDownload != null) _onDownload!(received, total);
        },
        options: Options(
          headers: {
            "User-Agent":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36"
          },
          followRedirects: false,
          responseType: ResponseType.bytes, // 设置响应类型为字节
        ),
      );
      return file;
    } catch (e) {
      if (_onDownloadFailed != null) _onDownloadFailed!();
      print(e);
      return null;
    }
  }

}
