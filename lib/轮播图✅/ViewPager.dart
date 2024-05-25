import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// 此案例演示了利用carousel_slider实现轮播图效果。
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarouselDemo(),
    );
  }
}

// 展示轮播图的页面
class CarouselDemo extends StatelessWidget {
  static const List<String> imgList = [
    'assets/轮播图图片素材/slide1.png',
    'assets/轮播图图片素材/slide2.png',
    'https://imgs.699pic.com/images/500/362/891.jpg!list1x.v2',
    'https://pic.huitu.com/pic/20230531/3248670_20230531151554010203_0.jpg',
  ];

  const CarouselDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Slider Demo'),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imgList
              .map((item) => Center(
                    // child: Image.network(item, fit: BoxFit.cover, width: 1000)
                    child: item.startsWith('assets/')
                        ? Image.asset(item, fit: BoxFit.cover, width: 1000)
                        : Image.network(item, fit: BoxFit.cover, width: 1000),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
