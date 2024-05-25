enum PageState {
  DEFAULT, //直接显示正文
  PRELOAD, //显示骨架屏，但不显示loading
  PRELOAD_UPDATED, //显示骨架屏,并且显示透明loading
  LOADING, //显示loading, 是不透明的
  SUCCESS,
  EMPTY, //空数据
  FAILED, //失败，200但接口返回false
  UPDATED, //更新，loading 背景透明
  CREATED, //已创建
  NO_INTERNET, //没有网络
  MESSAGE, //消息
  UNAUTHORIZED, //未授权
  NEED_LOGIN, //需要登陆
  FAILED_SERVER, //网络失败，比如404
}
