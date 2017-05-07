# 前言
<<Qt on Android核心编程>>
对于界面开发，还是基于Qt传统的Widgets

专门讲述Qt Quick的书籍，而且定位在入门层面

Qt 帮助 和 qmlscene。

ECMAScript

Qt Quick事件处理
QML与C++混合编程

Qt Quick是以Qt和ECMAScript为基础的

如果你想要进行Android开发，请先阅读笔者的《Qt on Android核心编程》

CSDN Qt论坛的版主

# 第1章 Qt Quick概览

高度直观的Qt API为C++编码，

快速上手的Qt标记性语言QML。

同时使用它们：为后端应用逻辑使用Qt C++，而使用QML开发用户界面

qml，语法格式非常像CSS，但又支持JavaScript形式的编程控制

在QML中，通过具有属性的对象树来表示用户界面

Qt Quick实现了ECMAScript语言，它作为QML的脚本语言，可以对QML进行逻辑方面的编程

# 第2章 Qt开发环境快速上手

选择“应用程序”项目下的“Qt Quick Application”模板

Qt Quick设计师类似于Qt Designer，但它是针对Qt Quick的

本书中的示例都是笔者手写的

qmlscene是用来测试QML应用的

# 第3章 QML语言基础

属性初始化语句可以分行书写，此时语句后可以不要“;”号

ECMAScript的“？：”三元运算符

通过对象的id值来引用一个对象

在一个QML文档中，每个对象都可以指定一个唯一的id

在QML中，注释与C++中一样

QMl的世界围绕着对象属性展开

驼峰命名法

### 3.4.3 属性的类型

可以在QML文档中使用的类型大概有三类：

(1)基本类型

QML中对象的属性是有类型安全检测的

(2)id属性

在同一个QML文件中不同对象的id属性的值不能重复

id属性的值，首字符必须是小写字母或下划线，并且不能包含字母、数字、下划线以外的字符

(3)列表属性

QML对象的列表属性（类型是list）

列表内只能包含QML对象

如果一个列表内只有一个元素，也可以省略方括号

(4)信号处理器

信号处理器，其实等价于Qt中的槽

一对花括号！这是ECMAScript中的代码块

(5)分组属性

使用一个“.”符号或分组符号将相关的属性形成一个逻辑组

分组符号（一对花括号）把要赋值的成员放在一起给它们赋值

(6)附加属性

keys就是Qt Quick提供的供Item处理按键事件的附加属性

# 第4章 Qt Quick入门

如果你不确定使用某种类型时应当导入哪个模块，可以使用Qt帮助的索引模式找到该类型

关于QQuickView的setSource()方法，它接受QUrl类型的参数，而QUrl可以识别qrc，但是必须以“qrc:”为前缀

两种启动Qt Quick App模式：
* QQmlApplicationEngine搭配Window
* QQuickView搭配Item

activeFocusItem属性类型是Item，保存窗口中拥有活动焦点的Item，可能为null

Android手机上固定采用横屏或竖屏模式，则需要修改AndroidManifest.xml中的activity元素的

android:screenOrientation属性为"lanscape"或"protrait"

## 4.3 基本元素初体验

### 4.3.1 Rectangle

gradient属性则用来设置渐变色供填充使用

### 4.3.2 颜色

关于颜色值，在QML中可以使用颜色名字，如blue、red、green、transparent等，也可以使用"#RRGGBB"

或者"##AARRGGBB"来指定，还可以使用Qt.rgba()、Qt.lighter()等方法来构造

### 4.3.3 渐变色

Gradient使用GradientStop来指定一个颜色值和它的位置（取值在0.0与1.0之间）

rotation属性，其实它来自于Rectangle的父类Item

### 4.3.4 Item

z属性，用来指定图元在场景中的Z序。z属性的类型是real，数值越小，图元就越低

Item的clip属性，它的目的是根据自己的位置和大小来裁切它自己以及孩子们的显示范围

Item的属性特别多，除了前面提到的，还有scale、smooth、anchors、antialiasing、enabled、visible、

state、states、children、transitions等

虽然Item本身不可见，但你可以使用Item来分组其他的可视图元

分组后可以通过Item的children或visibleChildren属性来访问孩子元素

采用绝对坐标的布局方式，不太容易适应多种多样的移动设备分辨率

一种全新的布局方式：锚布局。锚布局是通过Item的anchors属性实现的

### 4.3.5 使用锚布局

anchors提供了一种方式，让你可以通过指定一个元素与其它元素的关系来确定元素在界面中的位置

### 4.3.6 响应按键

Item通过附加属性Keys来处理按键

如果一个按键被处理，event.accepted应该被设置为true，以免它被继续传递

### 4.3.7 Text

如果你明确知道要显示的是富文本，则可以显式指定textFormat属性

Text元素的style属性提供了几种文字风格：Text.Outline、Text.Raised、Text.Sunken，可以使文字有点儿特别的效果

wrapMode

显示不下时省略处理，则可以设置elide属性

### 4.3.8 Button

checkable属性设置Button是否可选

iconName属性定图标的名字，，，iconSource则通过URL的方式来指定icon的位置

isDefault属性指定按钮是否为默认按钮，如果是默认的，用户按Enter键就会触发按钮的clicked()信号

menu属性允许你给按钮设置一个菜单（此时按钮可能会出现一个小小的下拉箭头），用户点击按钮时会弹出菜单。默认是null

action属性允许你设定按钮的action，action可以定义按钮的checked、text、tooltip、iconSource等属性，

还可以绑定按钮的clicked信号。action属性的默认值为null

### 4.3.9 ButtonStyle

control属性指向使用ButtonStyle的按钮对象，你可以用它访问按钮的各种状态

对于ButtonStyle，如果有多个按钮同时用到，上面的方式就有点繁琐了，此时我们可以使用Component

在QML文档内定义一个组件，设置其id属性的值为btnStyle，然后在Button中设定style属性时直接使用btnStyle

### 4.3.10 Image

Image可以显示一个图片

如果要显示动画，则可以使用AnimatedSprite或者AnimatedImage

Image默认会阻塞式地加载图片，，，可以设置asynchronous属性为true来开启异步加载模式

当Image识别到你提供的source是网络资源时，会自动启用异步加载模式

### 4.3.11 BusyIndicator

BusyIndicator用来显示一个等待图元

BusyIndicator的running属性是个布尔值，为true时显示。style属性允许你定制BusyIndicator。

默认的效果就是图4-11所示的那种，一个转圈圈的动画

### 4.4.2 FileDialog

FileDialog的实现是平台相关的，如果没有可用的原生文件对话框，则会尝试实例化一个QFileDialog，

如果失败，则使用默认的QML文件对话框

# 第5章 ECMAScript初探
# 第6章 Qt Quick事件处理
# 第7章 组件与动态对象
# 第8章 Qt Quick元素布局
# 第9章 Qt Quick常用元素介绍
# 第10章 Canvas（画布）
# 第11章 C++与QML混合编程
# 第12章 动画
# 第13章 Mode/View
# 第14章 多媒体
# 第15章 网络
# 第16章 定位
# 第17章 综合实例之文件查看器
# 第18章 综合实例之聊哈
# 附录A 常见问题
