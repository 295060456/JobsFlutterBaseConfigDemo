import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/%E8%B0%83%E8%AF%95/JobsCommonUtil.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsGetXRunner.dart';

void main() => runApp(JobsGetRunner(const AdvancedNetworkImageDemo(),
    title: 'AdvancedNetworkImage 全属性示例'));

class AdvancedNetworkImageDemo extends StatelessWidget {
  const AdvancedNetworkImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AdvancedNetworkImage(
          'https://via.placeholder.com/150', // ✅ 图片 URL

          scale: 1.0, // ✅ 图片缩放因子，默认 1.0，通常不用改

          width: 300, // ✅ 要缓存到内存中的图片宽度（像素）
          height: 300, // ✅ 要缓存到内存中的图片高度（像素）

          header: const {
            'Authorization': 'Bearer YOUR_TOKEN', // ✅ HTTP 请求头，自定义认证或参数
          },

          useDiskCache: true, // ✅ 是否启用磁盘缓存，默认为 true

          retryLimit: 3, // ✅ 下载失败最大重试次数
          retryDuration: const Duration(seconds: 2), // ✅ 每次重试间隔
          retryDurationFactor: 1.5, // ✅ 重试间隔因子（用于指数退避）

          timeoutDuration: const Duration(seconds: 5), // ✅ 网络超时时间

          loadedCallback: () {
            JobsPrint("✅ 图片加载成功");
          }, // ✅ 图片加载成功回调

          loadFailedCallback: () {
            JobsPrint("❌ 图片加载失败");
          }, // ✅ 图片加载失败回调

          loadedFromDiskCacheCallback: () {
            JobsPrint("💾 从磁盘缓存加载");
          }, // ✅ 从磁盘缓存加载时回调

          fallbackAssetImage: 'assets/backup.png', // ✅ 加载失败时使用的 asset 图片（备选）

          fallbackImage: Uint8List.fromList(
              []), // ✅ 加载失败时使用的内存图片（优先级低于 fallbackAssetImage）

          cacheRule: const CacheRule(
            maxAge: Duration(days: 7), // ✅ 缓存有效时间
            storeDirectory: StoreDirectoryType.document, // ✅ 缓存目录位置
          ),

          loadingProgress: (received, total) {
            JobsPrint("📦 加载中：$received / $total");
          }, // ✅ 实时加载进度（字节）

          getRealUrl: () async {
            JobsPrint("🔗 获取真实 URL");
            return 'https://via.placeholder.com/150'; // ✅ 动态 URL 获取逻辑（重定向或加密）
          },

          preProcessing: (bytes) async {
            JobsPrint("🧪 下载前处理");
            return bytes; // ✅ 下载前可处理图片数据（如解密）
          },

          postProcessing: (bytes) async {
            JobsPrint("🧼 存储前处理");
            return bytes; // ✅ 存储前处理，比如加水印
          },

          printError: true, // ✅ 是否打印加载错误信息到控制台

          skipRetryStatusCode: const [404, 403], // ✅ 遇到这些状态码就不再重试（节省资源）

          id: 'custom_image_id', // ✅ 可选标识，用于跟踪、调试或手动控制缓存
        ),

        width: 200, // ✅ Widget 显示的宽度
        height: 200, // ✅ Widget 显示的高度
        fit: BoxFit.cover, // ✅ 填充方式
      ),
    );
  }
}
