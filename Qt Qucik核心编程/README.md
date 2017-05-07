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

一个完整的JavaScript实现包含三个不同的部分：

* 核心（ECMAScript）
* 文档对象模型（DOM）
* 浏览器对象模式（BOM）

在Qt的帮助文档中有时并不严格区分ECMAScript与JavaScript，但其实两者是不同的

一种全新的编程语言，QML有三个核心：

* ECMAScript
* Qt对象系统
* Qt Quick标准库

qmlscene加载下面的QML文档来测试

## 5.1 语法

需要注意的是，QML引入的信号，是有安全类型检测的，在定义信号时，可以使用特定的类型来定义参数

ECMAScript则允许开发者自行决定是否以分号结束一行代码

ECMAScript借用了C、Java等语言的注释语法，支持两种类型的注释---单行注释和多行注释

## 5.2 变量

一个var语句定义的多个变量可以有不同的类型

也可以使用一个变量存储不同类型的值

对于变量（包括函数名），以小写字母开始，单词之间采用驼峰命名法。对于类名，以大写字母开始，单词之间采用驼峰命名法

在ECMAScript中，变量可以存放两种类型的值，即原始值和引用值

原始值一般就地存放在栈上，引用值是一个指针，指向存储在堆中的对象

## 5.3 原始类型

5种原始类型：Undefined、Null、Boolean、Number和String

typeof运算符来判断一个值的类型，，，如果这个值是引用值，那么typeof统一返回“object”作为类型名字

### 5.3.2 Undefined类型

当声明的变量未初始化时，该变量的默认值就是undefined

用于动态加载组件的Loader元素，当要卸载一个组件时，就需要为其sourceComponent属性赋值undefined

## 5.3.5 Number类型

当计算生成的数值大于Number.MAX_VALUE时，它将被赋值为Number.POSITIVE_INFINITY，即正无穷大

Number.NEGATIVE_INFINITY，即负无穷大

还有一个特殊值是NaN，表示非数。通常在类型转换时可那产生NaN

NaN：它不等于自己，因此要判断一个数是否是非数，推荐使用isNaN()方法

### 5.3.6 String类型

在ECMAScript中没有字符类型

String类型的变量是只读的，一旦赋值之后，该变量的值将不可修改

## 5.4 类型转换

### 5.4.1 转换成字符串

Number类型的toString()方法还可以按基转换

### 5.4.2 转换成数字

parseInt()和parseFloat()可以把非数字的原始值转换成数字，，，这两个方法只能用于String类型

parseInt()和parseFloat()会扫描字符串，直到遇到第一个非数字字符时停止，将转换的结果返回

parseInt()还支持基模式

### 5.4.3 强制类型转换

ECMAScript也支持强制类型转换，有三种转换

* Boolean(value)
* Number(value)
* String(value)

Number()转换的是整个值，，，返回NaN

对可转换为数字的字符串，Number()会自己决定调用parseInt还是parseFloat()

String可以把任何值转换为字符串，它与调用toString()方法的唯一不同在于：

对null或undefined值强制类型转换可以生成字符串而不引发错误

## 5.5 对象

在语法上与C++类似，如果类的构造函数的没有参数，括号可以省略

### 5.5.1 Object

Object类是所有ECMAScript类的基类

ECMAScript允许在运行时改变对象原型

valueOf，返回最适合该对象的原始值。对于许多类，该方法返回的值都与toString()一样

在ECMAScript中，对象的属性可以动态的增删

多数自定义属性和方法都是可以枚举的

### 5.5.2 String

charAt()方法可以访问指定索引位置的字符，，，而charCodeAt()方法返回指定位置字符对应的Unicode编码

大于（>）、小于（<）、等于（==）三个运算符可用于字符串比较，但它们使用字符的Unicode编码进行比较，

忽略了与本地语言环境相关的语义和排序规则，有时可能不是你想要的效果

localeCompare()方法在比较字符串时，默认采用底层操作系统提供的排序规则

使用“+”运算符可以更方便地连接字符串，效果和concat()一样

如果你想连接多个字符串并且指定它们之间的分隔符（填充字符），则可以使用Array对象存储字符串，

然后调用Array的join()方法

slice()遇到负数参数时，会应用“从串尾倒数”这种策略，，，

而substring()方法会把负数参数作为0处理，还有一点，substring()总是把较小的参数作为起始位置

大小写转换：

toLowerCase()或toLocalLowerCase;toUpperCase()或toLOcalUpperCase()方法

其中toLocalXXX方法基于特定的区域实现，与localeCompare()类似

字串查找时我们用到了正则表达式

QML在实现ECMAScript时对String对象做了扩充，加入了arg()方法

### 5.5.3 RegExp

在ECMAScript中支持两种构造正则表达式的方法：

* 字面量语法：/pattern/attributes
* 创建RegExp对象：new RegExp(pattern, attributes)

在“/String/i"中，i是修饰符，表示忽略大小写，这个正则表达式的意思就是匹配String这个单词，不管大小写

RegExp("String", "i");或者这么构建：new RegExp("String", "i")

QML中可以使用的修饰符有三个：

* "i",匹配时忽略大小写
* "g",查找所有匹配而非在找到第一个匹配后停止，即全局匹配
* "m",执行多行匹配

先解释下“\d+”这个模式。\d是元字符，表示查找数字。+是量词，表示重复一次或多次

### 5.5.4 Array

ECMAScript定义的Array是动态数组，其大小可以动态变化。而且数组中的元素，类型可以不同

push()方法向数组末尾插入一个或多个元素，它返回数组新的长度。

pop()方法删除并返回数组的最后一个元素

shift()方法删除并返回数组的第一个元素。unshift()方法向数组的开始添加一个元素并返回新的数组长度

reverse()方法可以颠倒数组中元素的顺序。注意，它会改变原来的数组

sort()，，，有一个可选的参数sortby,让你指定一个比较大小的函数

join方法可以把数组中的所有元素组合成一个字符串，字符串之间可以用给定的分隔符来填充

splice(index, howmnay, item1,......,itemN)方法，，，：删除从index开始的howmany个元素，

将item1到itemN插入到数组中，如果删除了元素，splice()会返回被删除元素组成的数组。注意，它会改变原有数组

### 5.5.6 Date

当使用无参构造函数创建Date()对象时，该对象会自动把当前日期和时间保存为其初始值

下列方法可以从Date对象中提取信息，，，

Date.now()，，，计算耗时

QML对ECMAScript定义的对象做了扩展，提供了下列与locale相关的方法，方便日期转换

name由语言代码和国家编码组成。

语言代码是两位小写字母（如zh表示汉语），由ISO 639标准定义

国家编码是两位大写字母（如CN表示中国），由ISO 3166标准定义

### 5.5.7 ，，，

ECMAScript有垃圾收集器（GC，Garbage Collection）

## 5.6 函数

ECMAScript不支持函数重载

即便没有显式使用return语句，它也会返回undefined

## 5.7 表达式和运算符

### 5.7.4 比较和逻辑运算符

=== 全等（值和类型）

比较运算符多数都可用于字符串，比较时基于字符串的Unicode编码，注意，这可能不是你想要的结果

### 5.7.5 条件运算符

？：是ECMAScript中唯一的三元运算符

### 5.7.6 位运算符

，，，

### 5.7.7 关键字运算符

void运算符比较特殊，它放在一个表达式前，舍弃表达式的值，返回undefined

instanceof用来测试一个对象的实际类型，你需要显示指定要测试的类型

delete运算符比较特别，，，它用于删除运算数所指定的对象的属性，而不能直接删除一个对象。

在QML中，一般它只能删除一个对象内由你定义的属性，而框架定义的那些核心属性，多数是你不能删除的

使用var运算符定义的变量，也不能直接delete

调用delete，多数时候是解除对对象的引用

### 5.7.8 逗号运算符

逗号运算符经常和for语句结合使用

### 5.7.9 数组和对象存取运算符

在ECMAScript中，如果你使用对象存取运算符访问某个对象的一个不存在的属性，不会报错，会返回undefined

## 5.9 使用console

console提供了输出日志信息、断言、计时器、计数器、性能分析等功能

### 5.9.1 输出日志信息

console.log()来输出其调试信息

### 5.9.2 断言

console.assert()提供断言功能，它接受一个表达式，当表达式的值为false时会输出调试信息，打印QML所在行

需要注意的是，在QML中，使用console.assert()，断言失败，程序并不会终止运行

### 5.9.3 计时器

console提供了计时器功能，方便我们测量某些代码的耗时情况

console.time(tag)启动定时器，字符串类型的tag是必需的

console.timeEnd(tag)停止计时器，在控制台输出某个标签对应的耗时信息。tag是必需的

## 5.10 内置对象

### 5.10.1 Global对象

ECMAScript，，，：没有独立的函数和属性，所有的属性和函数都从属于某个对象。

因此，Global对象应运而生，接管了那些，，，

URI编解码

encodeURL()方法用于处理完整的URI

encodeURIComponent()则对它发现的所有非标准字符进行编码

eval()方法，它用来执行一段ECMAScript。

eval()的参数是字符串，并且只能是原始字符串，如果你传递一个String对象给它，它会原封不动地返回你

### 5.10.2 JSON对象

RFC4627描述了JSON数据的交换格式

parse()用于解析JSON文本，生成ECMAScript对象

可选参数reviver是一个接受两个参数的函数（key和value），用于过滤和转换结果

stringify()可以将ECMAScript对象转换为JSON格式的字符串，即对象的字面量

如果value对象有toJSON方法，则stringify()会优先使用它来字符串化对象

## 5.11 来自QML的基本类型

当你使用它们来定义变量时，只能用于QML提供的宿主对象的属性定义或信号参数定义，

不能在ECMAScript脚本中直接使用它们定义变量，也不能使用它们在QML文档内嵌的ECMAScript函数、代码块内定义局部变量

### 5.11.1 url

如果你访问的资源、路径或URI中有非有效字符，，，encodeURL，，，

### 5.11.2 list

list对象只能存储对象，不能存原始值，不过你可以使用var代替原始值

### 5.11.4 font

屏幕尺寸和像素密度多种多样，建议使用pointSize

## 5.12 宿主对象Qt

Qt是Qml提供的一个全局宿主对象，整合了常用的属性、方法和枚举类型，方便开发者引用

### 5.12.1 Qt对象的属性

application.platform是一个对象，platform.os存储操作系统的名字

* "android"
* "ios"
* "linux"
* "osx"
* "windows"
，，，

### 5.12.3 Qt对象的方法

var today = new Date();
console.log(Qt.formatDateTime(today, "yyyy-MM-dd hh:mm:ss.zzz"));

# 第6章 Qt Quick事件处理

每一种用户可那使用的与计算机或手机交互的方式，在Qt Quick中都体现为事件---

MouseEvent、KeyEvent、GestureEvent、PinchEvent，，，

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
