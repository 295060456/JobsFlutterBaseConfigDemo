

///拷贝 easy_refresh  的头部 和 底部 源代码
///主要解决：底部 除 IndicatorResult.noMore  之外 ，其他状态无效的问题
///如何解决：在CupertinoIndicator  中多加_buildResultStateView 方法对IndicatorResult 多加判断