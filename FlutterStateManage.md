# Flutter 状态管理框架对比

## Riverpod
在这之前，我并没有打算写 `provider` 作为状态管理框架选型之一。

主要是 `riverpod` 和 `provider` 的作者是同一人，`riverpod` 可以作为 `provider` 升级版本来看待。

`riverpod` 解决了 `provider的几个问题：`

- `provider` 依赖父级 `widget` ， 如果兄弟 `widget` 想要通信，那么就必须由他们的父级 `widget` 来通信。

- `provider` 子级依赖父级传递的值，如果有多组数据，传递会非常困难。

- 不依赖 `BuildContext`， 有时无法在需要的地方获得 `BuildContext`。


作者提供的三种使用 `riverpod` 的方式
![三种使用 riverpod 的方式](https://upload-images.jianshu.io/upload_images/14933604-9279e37498ea8df3?imageMogr2/auto-orient/strip|imageView2/2/format/webp)

`riverpod` 有 `hooks` 版本，对一些常用的方法进行了封装，来方便使用，比如 `useTextEditingController` 就是对 `TextEditingController` 的封装。

DEMO

## Mobx
Mobx 上手非常简单， 通过装饰器语法对 class 中的属性或方法添加 observable、action 即可做到响应式更新。

MobX 核心概念图：
![MobX 核心概念图：](https://image-static.segmentfault.com/311/533/3115332324-7beaaab89b13f598)

但是缺点主要有两个：
1. 无法做到多页面共享数据，需要使用 Provider 进行依赖注入。

      官方推荐的用法
![官方推荐的用法](https://image-static.segmentfault.com/268/612/2686124140-261ef2762ca432c4)

2. 使用步骤上有些麻烦， Mobx 相比其他库，多了一个生成代码的操作。

    当我们开始写 store.dart 里的代码时，需要先将未来将会被编译并生成的文件进行引入( store.g.dart ).
```dart
// store.dart
import 'package:mobx/mobx.dart';

part 'store.g.dart';
```

## Redux
Redux 和 Mobx 一样，相对于前端转 dart 的程序员来说， 这种库理解起来相对简单容易。

Redux 的优点是与 UI 无关， 只进行数据的更新，独立抽象为一个 Redux 层,不依赖 `BuildContext`。

![](https://blog.logrocket.com/wp-content/uploads/2021/10/data-flow-redux-data-structure.png)

Redux 的工作原理图

![](https://pic2.zhimg.com/v2-ddeb4c146759063b0c0abb7d1e2e4061_r.jpg)

## Bloc
> BLoC全称（Business Logic Component)是谷歌提出的一种设计模式，利用流的方式实现界面的异步渲染和重绘，我们可以非常快速的通过BLoC实现业务与界面的分离。

Bloc 目前我不是很懂，上手难度有些高。

这里就放两张关于 Bloc 的概念图。

![](https://img-blog.csdnimg.cn/3246e38d11af427eb559380f8e16cdda.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBAbmljZXBhaW5raWxsZXI=,size_19,color_FFFFFF,t_70,g_se,x_16)

![](https://img-blog.csdnimg.cn/129636241b18439a9f709bc06305e6bb.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBAbmljZXBhaW5raWxsZXI=,size_19,color_FFFFFF,t_70,g_se,x_16)

## Getx
Getx 和 Flutter 的关系， 我个人觉得就像 javascript 和 Vue 的关系。

这里放一张官方文档的图。

![](https://raw.githubusercontent.com/jonataslaw/getx-community/master/getx.png)

Getx 的主要功能有：
1. 路由管理
2. 状态管理
3. 离线存储
4. 内存缓存
5. i18n
6. 主题切换
7. 依赖注入 + Bingds
8. Getx 封装的组件
9. 网络请求
10. 其他Api


- GetX 有3个基本原则：

  - 性能： GetX 专注于性能和最小资源消耗。GetX 打包后的apk占用大小和运行时的内存占用与其他状态管理插件不相上下。如果你感兴趣，这里有一个性能测试。
  - 效率： GetX 的语法非常简捷，并保持了极高的性能，能极大缩短你的开发时长。
  - 结构： GetX 可以将界面、逻辑、依赖和路由完全解耦，用起来更清爽，逻辑更清晰，代码更容易维护。

  - GetX 并不臃肿，却很轻量。如果你只使用状态管理，只有状态管理模块会被编译，其他没用到的东西都不会被编译到你的代码中。它拥有众多的功能，但这些功能都在独立的容器中，只有在使用后才会启动。

- Getx有一个庞大的生态系统，能够在Android、iOS、Web、Mac、Linux、Windows和你的服务器上用同样的代码运行。 通过Get Server 可以在你的后端完全重用你在前端写的代码。


## 总结

| 选型         | 优点        |    缺点     |
| ----------- | ----------- |----------- |
| Riverpod | 没有层级依赖,官方推荐框架 | 使用起来略显笨拙，需要一个自定义的widget|
| Mobx |  使用简单，适合前端使用   | 需要进行实时编译，不支持页面共享数据｜
| Redux |使用简单，适合前端使用  | 概念较多比较难理解 |
| Bloc | 能够很好地实现业务逻辑的复用以及视图与业务逻辑的分离 | 使用上结构相对复杂 |
| Getx | 功能强大，上手简单 | 注释和文档比较糟糕 |

