# Flutter 简单记录

## Dart

+ 实战时，除去 Widget 的简单使用，发现其实 Dart 语法还是特别重要的，建议上手 Flutter 之前大概连接 Dart 的基础语法和编码规范思路

+ 实例化时 new 可以省略

## 实战 Demo > Article

+ 简单展示下自己 Blog 的数据，当个小练习

+ 获取 文章列表：请求及数据处理，然后反馈到页面上的流程，需要重新梳理清楚 TODO

## Directory

## Assets

+ Asset 是要打包到应用中的静态资源，包括字体、配置、图片等等。需要在根目录下的 `pubspec.yaml` 中声明具体的资源目录，如：

```yaml
flutter:
  assets:
    - assets/cat.gif
    - assets/octocat.png
```

+ `Variant` 变体。在相邻子目录中存在相同名称的文件，这些文件会随指定的 `- assets/xxx.png` 一起打包进 `asset bundle` 中，比如不同分辨率的自适应图片、本地化等功能就可以靠这个实现

## Widget

+ 核心思想是 Widget，看的见的组件或看不见的布局等都是 Widget，大部分都要有 build 方法

### Image

+ 使用本地资源：`new Image.asset(filePath)`

+ 使用网络图片：`new Image.network(url)`。只是改功能只支持基本实现，图片渐隐渐现、缓存需要额外实现方案

## Navigator

+ 示例 `main.dart` 中的路由实现方式，是通过在 `Navigator.push` 中传入一个实现 `builder` 方法的 `MaterialPageRoute` 对象实现

+ 除此之外，还能通过在新建 `MaterialApp` 时传入 `home: HomePage(), routes: <String, WidgetBuilder> { '/a': (BuildContext ctx) => CustomPage() }` 实现，HomePage 默认对应 '/' 路由，此时跳转方法为 `Navigator.pushNamed(context, '/a')`

+ 新页面传值：Navigator.pushXXX() 构造函数中传入新页面需要的数据，往上一级页面传值：Navigator.pop() 构造函数中传值

+ 管理多个导航路由，可以把不同的路由组件写在不同文件中，然后在 main.dart 中引入后集中管理，最主要的还是熟悉 dart 语法，可参照 `lib/route-test.dart`

+ 路由是以栈的形式管理的，除了以上描述的几种形式外，还有其它场景需求：比如底部 Tab 跳转时，不想跳转后 Header 还有返回按钮的：所以需要的操作就是用新的路由替换掉之前所有的入栈页面，`pushReplacement` 和 `pushReplacementNamed` ，但这种情况会清空之前所有页面的信息，无法返回到上个页面的状况；另外一种方案是只修改 Header 中返回按钮的展示状态，不修改栈里页面的信息，这样返回时可以跳到上页，且能保存之前的状态。两者混合使用感觉就能解决大部分路由跳转的问题

### Base Layout

+ 所有布局组件都有一个 child 或者 children 属性

+ 整体的布局思路其实与 Web 端的 flex 很类似，掌握好语法之后其实是很易于理解书写的

#### 盒约束

+ 盒约束是指widget可以按照指定限制条件来决定自身如何占用布局空间，所谓的“盒”即指自身的渲染框。

+ 一般分为三类：

  + 尽可能大：Center、ListView 等

  + 跟随子 Widget 大小：Transform、Opacity 等

  + 指定尺寸：Image、Text 等

  + Container 等默认尽可能大，但可根据参数可变动

#### Container

+ 类似于 Web 端的 div

+ 可以添加 margin、padding 和 border，改变背景色和背景图

#### GridView

+ 网格布局，检测列内容超过渲染框时自动提供滚动，它的内容对于其渲染框太长时会自动提供滚动

#### ListView

+ 本质上是用于组织盒子中列表的特殊 Column，可水平垂直放置，支持滚动

+ `new ListView()` 会一次性创建所有 Item，`new ListView.builder()` 会在该 Item 滚动到屏幕上时才会发起渲染

#### Stack

+ 类似于 Web 中的 absolute 定位

+ 子列表的第一个 Widget 是 base element，随后的 Widget 覆盖在第一个的顶部

+ 里面的内容不支持滚动，超出渲染框的子组件可以背剪切掉
