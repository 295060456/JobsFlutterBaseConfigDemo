import 'package:flutter/material.dart';
import 'package:get/get.dart';
// 定义页面状态枚举
enum PageState {
  // ignore: constant_identifier_names
  DEFAULT,
  // ignore: constant_identifier_names
  LOADING,
  // ignore: constant_identifier_names
  SUCCESS,
  // ignore: constant_identifier_names
  ERROR,
}
// 使用 GetX 状态管理器来管理页面状态。
void main() {
  runApp(PageStateDemo());
}

class PageStateDemo extends StatelessWidget {
  // 使用 GetX 状态管理器
  final pageState = PageState.DEFAULT.obs;

  PageStateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Page State Demo'),
        ),
        body: Obx(() {
          // 根据页面状态返回不同的 UI
          switch (pageState.value) {
            case PageState.DEFAULT:
              return _buildDefaultUI();
            case PageState.LOADING:
              return _buildLoadingUI();
            case PageState.SUCCESS:
              return _buildSuccessUI();
            case PageState.ERROR:
              return _buildErrorUI();
            default:
              return Container();
          }
        }),
        // 模拟页面状态转换
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 模拟状态切换
            switch (pageState.value) {
              case PageState.DEFAULT:
                pageState(PageState.LOADING);
                break;
              case PageState.LOADING:
                pageState(PageState.SUCCESS);
                break;
              case PageState.SUCCESS:
                pageState(PageState.ERROR);
                break;
              case PageState.ERROR:
                pageState(PageState.DEFAULT);
                break;
              default:
                break;
            }
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }

  // 默认状态 UI
  Widget _buildDefaultUI() {
    return const Center(
      child: Text('Default State'),
    );
  }

  // 加载中状态 UI
  Widget _buildLoadingUI() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // 成功状态 UI
  Widget _buildSuccessUI() {
    return const Center(
      child: Text('Success State'),
    );
  }

  // 错误状态 UI
  Widget _buildErrorUI() {
    return const Center(
      child: Text('Error State'),
    );
  }
}
