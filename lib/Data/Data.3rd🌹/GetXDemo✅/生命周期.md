# 生命周期

## 数据层（Controller）的生命周期

* 数据层通常由 GetX 控制器（Controller）来管理。控制器的生命周期方法有：
  * onInit：在控制器实例化时调用，适合初始化数据。
  * onReady：在界面完全加载后调用，适合进行网络请求等操作。
  * onClose：在控制器被销毁时调用，适合清理资源。

## UI层（Widget）的生命周期

* UI 层通常由 StatefulWidget 来管理。常用的生命周期方法有：
  * initState：在 Widget 被插入到树中时调用，适合初始化动画、控制器等。
  * didChangeDependencies：在依赖的 InheritedWidget 改变时调用。这个方法会在initState之后立即调用一次，并且每当该State对象依赖的对象发生变化时再次调用。通常用于需要依赖于InheritedWidget的情况。
  * build：用于构建 Widget 树。必须实现的方法，用于描述如何构建这个Widget。在initState和didChangeDependencies之后调用，并且每当需要重新构建Widget时调用。
  * dispose：在 Widget 被从树中永久移除时调用，适合释放资源。
  * deactivate：当State对象从树中被移除时调用，但可能会重新插入树中。
  * didUpdateWidget：在StatefulWidget重新构建时调用，并且这个State对象仍然在树中时调用。接受一个旧的Widget实例作为参数，可以用于比较新的属性和旧的属性以决定是否需要更新。
  * reassemble：主要用于开发调试阶段，在热重载（hot reload）时调用。

## 其他

* setState：通常不是生命周期方法，但它用于通知Flutter框架该State对象的内部状态已经改变，需要重新调用build方法。
