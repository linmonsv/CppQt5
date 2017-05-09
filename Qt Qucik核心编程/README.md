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

## 6.1 Qt Quick中的信号与槽

### 6.1.1 连接QML类型的已知信号

（1）信号处理器

当信号时Clicked()时，信号处理器就命名为onClicked，，，以on起始后跟信号名字（第一个字母大写）

还有一种情况，要处理的信号不是当前元素发出来的，

而是来自其他类型（对象），比如处理按键的Keys，这就是附加信号处理器

（2）附加信号处理器

而附加信号处理器，则要遵循<AttachingType>.on<Signal>语法

Component对象也有一些附加信号，如completed()、destruction()，

可以用来在Component创建完成或销毁时执行一些ECMAScript代码来做与初始化或反初始化相关的工作

（3）Connections

一个Connections对象创建一个到QML信号的连接

Connections有一个属性名为target，它指向发出信号的对象

### 6.1.2 如何寻找感兴趣的信号

QML中的信号，一类是输入时间触发的，一类是属性变化触发的

Q_PROPERTY宏就是用来定义QML中可访问属性的，当你看到NOTIFY字样时，它后面的字段就是与属性绑定的信号的名字。

Qt实现了动态属性绑定

### 6.1.3 定义自己的信号

signal关键字给你的类型添加信号，，，

在信号处理器中调用我们刚定义的信号；colorPicker.colorPicked(colorPicker.color);，，，

Loader是专门用来动态创建组件的，它可以从QML文件中创建组件，也可以指定sourceComponent来创建

### 6.1.4 信号与槽的连接

signal对象的connect()防范允许你连接一个信号到另外一个信号或者方法

## 6.2 鼠标

### 6.2.2 MouseArea

MouseEvent的button属性保存了被按下的鼠标按键信息，x、y属性保存了鼠标指针的位置。

还有一个比较重要的属性accepted，如果你处理鼠标事件后不想这个事件再往下传递，就设置其值为true

## 6.3 键盘

### 6.3.2 Keys与信号处理器

KeyEvent代表一个按键事件，如果一个按键被处理，event.accepted应该被设置为true，以免它继续传递；

要是你不设置它，那它可能会继续传递给其它的Item，出现一些奇怪的问题

forwardTo属性是列表类型，它表示传递按键事件给列表内的对象，

如果某个对象accept了某个按键，那位列其后的对象就不会收到该按键事件

也可以在你处理完感兴趣的时间后再调用父类的keyPressEvent()

如果你想让某个元素处理按键，则需要把焦点给它，这通过Item的focus属性来控制，设置为true即可

## 6.4 定时器

### 6.4.1 定时器对象介绍

定时器，就是周期性触发的一个事件，，，你可以利用定时器来完成一些周期性的任务

repeat设定定时器是周期性触发还是一次性触发，默认是一次性的；

running属性，设置为true定时器就开始工作，设置为false就关闭，默认值是false；

triggeredOnStart属性，，，如果你设置这个属性为true，那么定时器开始执行时立马先触发一次，默认值是false

## 6.5 触摸事件

### 6.5.1 PinchArea

PinchArea代表捏拉手势

（1）属性

pinch属性描述捏拉手势的详情，它是一个组合属性

（2）信号

PinchArea有三个信号：pinchStarted()、pinchUpdated()、pinchFinished()

pinchUpdated()信号就会不断地发射，你可以在它的信号处理器中通过pinch参数，截取你需要的值来更新PinchArea寄生的Item的状态

（3）怎样使用

要想使用PinchArea来变换一个Item，有两个方法：

* 设定target属性，，，
* 处理pinch，，，信号

### 6.5.3 多点触摸

mouseEnabled属性控制是否响应鼠标事件，为true（默认值）时，鼠标会被作为一个触点处理；为false时，鼠标事件会被忽略

touchPoints是列表属性，保存用户定义的用于和Item绑定的触点

MultiPointTouchArea还有pressed、released、updated、touchUpdated、canceled、gestureStarted等信号，我们也可以通过它们来实现应用的交互逻辑。13.8节的找图看实例，通过这些信号实现了手指滑动切换图片、两指捏拉缩放图片等常见功能

touchUpdated信号在有新增触点，已有触点移动、释放、取消时都会触发。它的参数也是touchPoints。

要是有别的Item偷走了你的触摸事件，你会收到canceled信号。

gestureStarted信号多用于MultiPointTouchArea嵌套在Flickable或另外的MultiPointouchArea中这些情景下。在你收到这个信号时，有权决定是否霸占当前触点，

# 第7章 组件与动态对象

## 7.1 Compon（组件）

Component是由Qt框架或开发者封装好的、只暴露了必要接口的QML类型，可以重复利用

一个Component既可以定义在独立的QML文件中，也可以嵌入到其它的QML文档中来定义

### 7.1.1 嵌入式定义组件

，，，最终形成一个具有特定功能的组件

Component通常用来给一个view提供图形化组件

你定义的组件是一个新的类型，它必须被实例化以后才可能显示。

而要实例化一个嵌入在QML文档中定义的组件，则可以通过Loader

### 7.2.2 在单独文件中定义组件

很多时候我们把一个Component单独定义在一个QML文档中

定义Component时要遵守的一个约定：组件名必须和QML文件名一致，，，组件名的第一个字母必须是大写的

在单独文件内定义组件，不需要Component对象，只有在其他QML文档中嵌入式定义组件时才需要Component对象

组件实例的id和组成组件的顶层Item的id是各自独立的

两种使用QMl自定义信号的方式，，，信号处理器，，，signal对象的connect()方法连接，，，

## 7.2 使用Loader

Loader用来动态加载QML组件

### 7.2.1 Loader详细介绍

Loader可以使用其source属性加载一个QML文档，也可以通过其sourceComponent属性加载一个Component对象

对于信号的访问，我们则可以使用Connections对象

Loader和它所加载的Item具有相同的尺寸，这确保你使用锚来布局Loader就等同于布局它加载的Item

如果Loader加载的Item想处理按键事件，那么必须将Loader对象的focus属性设置为true。

又因为Loader本身也是一个焦点敏感的对象，所以如果它加载的Item处理了按键事件，则应当将事件的accepted属性设置为true，以免已经被吃掉的事件再传递给Loader。

### 7.2.2 从文件加载组件

* 一处是将sourceComponent修改为source，其值为“，，，.qml”
* 一处是两个Connections对象，在onColorPicked信号处理器中，设置了Loader的焦点属性，因为只有Loader有焦点，它加载的Item才会有焦点，如果用鼠标点击某个颜色选择组件而加载它的Loader没有焦点，那么虽然颜色可以改变，但是焦点框出不来。

### 7.2.3 利用Loader动态创建于销毁组件

通过将redLoader的sourceComponent属性设置为undefined、将blueLoader的source属性设置为空串来卸载它们。

这是卸载Loader所加载的组件的两种方式。

使用Loader控制组件的动态创建与销毁，只是QtQuick提供的动态维护对象的两种方式中的一种。

还有一种，就是在ECMAScript中动态创建QML对象。

## 7.3 在ECMAScript中动态创建对象

QML支持在ECMAScript中动态创建对象。这对于延迟对象的创建、缩短应用的启动时间都是有帮助的。

同时这种机制也使得我们可以根据用户的输入或者某些事件动态地将可见元素添加到应用场景中。

在ECMAScript中，有两种方式可以动态地创建对象：

* 使用Qt.createComponent()动态地创建一个组件对象，然后使用Component的createObject()方法创建对象。
* 使用Qt.createQmlObject()从一个QML字符串直接创建一个对象。

如果你在一个QML文件中定义了一个组件（比如我们的ColorPicker），而你想动态地创建它的实例，使用Qt.createComponent()是比较好的方式；

而如果你的QML对象本身是在应用运行时产生的，那么Qt.createQmlObject()可能是比较好的选择。

### 7.3.1 从组件文件动态创建Component

第一个参数url指向QML文档的本地路径或网络地址；

第二个参数mode指定创建组件的模式，可以是Component.PreferSynchronous（优先使用同步模式）或Component.Asynchronous（异步模式），

忽略mode参数时，默认使用PreferSynchronous模式；

对于嵌入在QML文档内定义的Component，因为Component对象是现成的，可以略去Qt.createComponent()调用，直接使用createObject()方法创建组件实例。

### 7.3.2 从QML字符串动态创建Component

createQmlObject，，，第三个参数用于给新创建的对象关联一个文件路径，主要用于报告错误。

### 7.3.3 销毁动态创建的对象

它的visible属性设置为false或者把opacity属性设置为0，

我们这里说的动态创建的对象，特指使用Qt.createComponent()或Qt.createQmlObject()方法创建的对象，

而使用Loader创建的对象，应当通过将source设置为空串或将sourceComponent设置为undefined触发Loader销毁它们。

要删除一个对象，可以调用其destroy()方法。

QML引擎会在当前代码块执行结束后的某个合适的时刻删除它们。所以，即便你在一个对象内部调用destroy()方法也是安全的。

# 第8章 Qt Quick元素布局

有两套与元素布局相关的类库，一套叫做Item Positioner（定位器），一套叫做Item Layout（布局）

还有个锚布局，它通过Item的anchors属性实现

## 8.1 定位器

定位器不会改变它管理的元素的大小

### 8.1.1 Row

在一个Row内的Item，可以使用Positioner附加属性来获知自己在Row中的详细信息。

Positioner有index、isFirstItem、isLastItem三个属性

Row还有，，，populate，，，Transition类型的属性，，，定位器初始化创建items三种场景的过度动画

### 8.1.2 Colomun

### 8.1.3 Grid

你可以通过rows和columns属性设定表格的行、列数。

如果不设置，默认只有4列，而行数则会根据实际的Item数量自动计算。

rowSpacing和columnsSpacing指定行、列间距，单位是像素

### 8.1.4 Flow

Flow其实和Grid类似，不同之处是它没有显式的行、列数，它会计算子item的尺寸，然后与自身尺寸比较，按需折行

### 8.1.5 定位器嵌套

Qt Quick的定位器元素是可以嵌套的

## 8.2 布局管理器

### 8.2.1 GridLayout

width:300 设置，，，宽度，，，

Layout.columnSpacn: 3 ，，，设置，，，三行三列（单元格合并），，，

Layout.fillWidth: true ，，，设置，，，填充，，，所有可用宽度

### 8.2.2 RowLayout

Layout.fillWidth，，，

### 8.2.3 ColumnLayout

## 8.3 其他的布局方式

# 第9章 Qt Quick常用元素介绍

## 9.1 行编辑（TextInput与TextField）

### 9.1.1 TextInput

TextInput不支持使用HTML标记的富文本

length属性返回编辑框内的字符个数，使用它比通过text属性取得文本再调用String对象的length方法效率要高很多。

maximumlength设置，，，超过这个长度会被截断

TextInput的cursor就是光标，可以通过cursorDelegate来定制它的外观

displayText属性就保存显示给用户的文本，而text属性则保存实际输入的文本

当用户按了回车键或确认键，或者编辑框失去焦点时，会发出accepted和editingFinished信号，开发者可以实现onAccepted和onEditingFinished信号处理器来处理

### 9.1.2 TextField

TextInput没有背景，是透明的，能够与父控件无缝结合。而TextField有背景，其背景色可通过TextFieldStyle的（Component类型的）background属性来设定

## 9.2 文本快（TextEdit与TextArea）

TextArea支持文本滚动

## 9.3 ExclusiveGroup

ExclusiveGroup（互斥分组）本身是不可见元素，用于将若干个可选择元素组合在一起供用户选择其中的一个选项

也可以定义一个只设置了id属性的ExclusiveGroup对象

## 9.4 RadioButton

RadioButton用于多选一的场景，使用时需要通过exclusiveGroup属性为其指定一个分组

### 9.4.1 RadioButtonStyle

RadioButtonStyle用来定制一个RadioButton

### 9.4.2 ，，，

QML文件内嵌入了一个RadioButtonStyle组件，将选中图标变成了椭圆形，将选中时的文字变成了蓝色

## 9.5 CheckBox

部分选中状态，举个例子，比如一个选项下面又有几个子选项，当子选项中的部分选项被选中时，父选项的选中狂的状态就是部分选中

如果你指定了exclusiveGroup属性，那么同属于一个互斥组的复选框，也可以达到多选一的效果

## 9.6 GroupBox

GroupBox本身也支持选中，可以通过checkable属性来设置。当你设置checkable为true时，它的标题栏会出现一个复选框，

如果你勾选了它，那么它的子控件就是可选中的，否则它的子控件就不可操作。

当分组狂可选时，checked属性保存其选中状态

## 9.7 ComboBox

列表框部分可以是一直显示的，也可以是隐藏的

editable属性决定下拉列表框的编辑控件是否可以编辑，默认为false，为true时可以编辑，

此时editText保存编辑框内的内容，同时也可以设置validator属性来限制用户可以输入的文本

ComboBox示例使用的ListModel，内部数据有text和color两个角色

## 9.8 ProgressBar

indeterminate属性比较有意思，当你不知道实际进度时，设置它为true，ProgressBar就会变身为BusyIndicator了，请稍等，就不告诉你等多久，，，它的默认值为false

### 9.8.1 ProgressBarStyle

background用来绘制进度条的背景，progress用来绘制进度

## 9.9 TabView

addTab（title，component）方法用于增加一个标签，第一个参数是标签的标题，第二个参数是一个组件，代表标签对应的可视控件。insertTab（index，title，component）在指定索引位置插入一个标签

## 9.10 Slider

Slider类代表一个水平或垂直的滑块控件，通常用于让用户在某个取值范围内选择一个值

### 9.10.1 SliderStyle

groove属性指向滑槽组件，handle指向滑块组件，tickmarks指向刻度线组件

panel是整个滑块控件的可视对象的根哦，它内部使用Loader来加载groove、handle和tickmarks，如果你要定义panel，就要自己安排其他组件的位置

## 9.11 Flickable

Flickable这个Item比较特别，它生来就是“晃悠”其他Item的。如果你把一个Item放在Flickable内，那这个Item就可以被拖动，当子Item的边界已经显示出来后，你再拖使劲拖，那子Item的边界就像用弹簧连在了Flickable的边界上，你一松手，子Item就开始轻轻弹动，然后慢慢归于平静

当用户开始拖动Flickable对象时发出movementStarted信号。当用户释放鼠标（或手指），拖动结束时，如果Flickable控制的Item的边界还没显示出来，就直接发射movementEnded信号。

如果拖着拖着，被Flickable控制的Item边界显露出来了，并且被拖离了Flickable的边界，此时用户释放鼠标或手指，flickStarted信号发射，然后，被控制的Item会弹动一阵子（具体时间由horizontalVelocity、verticalVelocity、flickDeceleration等属性决定），最后静止下来，此时发射flickEnded信号，紧接着发射movementEnded信号。

contentX、contentY保存被Flickable控制的Item所代表的对象处在Flickable对象左 上角的坐标。

可以通过这两个值加上flickStarted()和flickEnded()信号来实现下拉或上拉刷新。上 拉、下拉刷新，在智能手机上是很常见的交互模式，

## 9.12 Screen对象

Screen对象值的是显示Item的那个屏幕（有的设备有多个屏幕），它提供了一些只读属性来描述屏幕参数

# 第10章 Canvas（画布）

QML中的Canvas，俗称画布，它用来定义一个绘图区域

## 10.1 开始之前

### 10.1.1 画布

### 10.1.2 画师

索引模式查找“Context2D”关键字

getContext("2d")

### 10.1.3 画笔

strokeStyle属性

### 10.1.4 画刷

画刷，就是用来填充画笔勾勒出的区域的

在Context2D这里，fillStyle属性就是描述画刷的

### 10.1.5 坐标系

### 10.1.6 图元

图元，其实是”图形元素“一词的简称，指可以编辑的最小图形单位

在使用Canvas和Context2D时，基本的图元有线、弧、矩形、曲线、文本、图片等

## 10.2 基本绘图模式

onPaint()信号处理器内使用Context2D对象来绘图

有两种使用Context2D对象的方式，上面的示例中在onPaint信号处理器中调用getContext("2d")获取Context2D对象，这是一种方式

还有一种方式，当我们设置了Canvas对象的contextType属性（2D绘图时取值为”2d“)后，context属性就会保存一个可用的Context2D对象

## 10.3 绘制路径

调用stroke()方法结束路径的绘制并使用strokeStyle保存的颜色描画路径的边线

Context2D的createLinearGradient()方法用于创建一个线性渐变对象，createRadialGradient()方法可以创建一个放射渐变对象，，，

Context2D对象与路径相关的方法还有很多，moveTo()方法可以移动到某个点，以这个点为起点开始一个新路径。

closePath()方法用于结束当前的路径，从路径终点到起点绘制一条直线来封闭路径

二次方贝赛尔曲线（quadraticCurveTo()）、三次方贝赛尔曲线（bezierCurveTo()），，，

## 10.4 绘制文本

## 10.5 绘制图片

只有成功加载的图片，才可以使用Context2D来绘制

## 10.6 变换

平移变换、绘图操作完成后，应当调用restore()来恢复之前的画布状态，否则发生重绘时（比如用户拖动窗口改变大小），你就看不见绘制的图元了。而要restore()必先save()

## 10.7 裁切

Context2D的clip()方法，让我们能够根据当前路径包围的区域来裁切后续的绘图操作在此区域之外的图像都会被丢弃掉

## 10.8 图像合成

Context2D允许我们绘制一个图元，将其与已有的图像按照globalCompositeOperation属性指定的模式合成

## 10.9 ，，，

事件过滤器，过滤BACK按键

int main(，，，)
，，，
app.installEventFileter(new KeyBackQuit());

# 第11章 C++与QML混合编程

混合使用QML和C++：使用QML构建界面，使用C++实现非界面的业务逻辑和复杂运算

在QML中访问C++对象必然不成问题，，，反过来，在C++中其实也可以使用QML对象

在C++中实现一个ColorMaker类，它可以被注册为一个QML类型供QML文档像内建类型一样使用，

它的实例也可以导出为QML上下文属性以便在QML环境中访问

## 11.1 在QML中使用C++类和对象

QML其实是对ECMAScript的扩展，融合了Qt Object系统，它是一种新的解释型语言，，，

Qt提供了两种在QML环境中使用C++对象的方式：

* 在C++中实现了一个类，注册为QML环境的一个类型，在QML环境中使用该类型创建对象
* 在C++中构造一个对象，将这个对象设置为QML的上下文属性，在QML环境中直接使用该属性

不管哪种方式，对要导出的C++类都有要求

### 11.1.1 定义可以导出的C++类

要想将一个类或对象导出到QML中，下列的前提条件必须满足：

* 从QObject或QOject的派生类继承
* 使用Q_OBJECTS宏

（1）信号、槽

只要是信号或者槽，都可以在QML中访问，你可以把C++对象的信号连接到QML中定义的方法上，

也可以把QML对象的信号连接到C++对象的槽上，还可以直接调用C++对象的槽或信号，，，

（2）Q_INVOKABLE宏

在定义一个类的成员函数时使用Q_INVOKEABLE宏来修饰，就可以让该方法被元对象系统调用

在QML中就可以用${Object}，${method}来访问了

（3）Q_ENUMS宏

如果你要导出的类定义了想在QML中使用的枚举类型，可以使用Q_ENUMS宏将该枚举类型注册到元对象系统中

（4）Q_PROPERTY宏

Q_PROPERTY宏用来定义可通过元对象系统访问的属性

不是所有的选项都必须设定，，，

* READ标记
* WRITE标记
* NOTIFY标记，可选配置。给属性关联一个信号（该信号必须是已经在类中声明过的），当属性的值发生变化时就会触发该信号。信号的参数，一般就是你定义的属性

### 11.1.2 注册一个QML可用的类型

（1）注册QML类型

qmlName则是QML中可以使用的类名

注册动作一定要放在QML上下文创建之前，否则的话，没有用

（2）在QML中导入C++注册的类型

在QML文档中加入import，，，

（3）在QML中创建C++导入类型的实例

### 11.1.3 完整的ColorMaker实例

### 11.1.4 将一个C++对象导出为QML属性

还可以把C++中创建的对象作为属性传递到QML环境中，然后在QML环境中访问

（1）注册属性

（2）在QML中使用关联到C++对象的属性

## 11.2 在C++中使用QML对象

只要我们找到QML环境中的某个对象，就可以通过元对象系统来访问它的属性、信号、槽等

### 11.2.1 查找一个对象的孩子

### 11.2.2 使用元对象调用QML对象的方法

QmetaObject的invokeMethod()方法用来调用一个对象的信号、槽、可调用方法

多达10个可以传递给被调用方法的参数

假设一个对象有这么一个槽compute(QString, int, double)，返回一个QString对象，那么，，，

### 11.2.3 ，，，

有关QML文档根对象的获取，如果使用QQuickView+Item的程序结构方式，

通过QQuickView的rootObject()直接可以得到QML文档的根Item对象。

而，，，采用QQmlApplicationEngine+Window的程序结构方式，QML文档根对象的获取就麻烦些，

示例中通过QQmlApplicationEngine的rootObject()方法获取到engine加载到QML生成的所有顶层对象的列表，

然后遍历、比较objectName，根据QML中设置的对象名字“rootObject”来找到正确的QML根对象

## 11.3 ，，，

# 第12章 动画

Qt Quick提供了比较丰富的动画类库，可以让我们的界面动起来。

一般的动画都是通过操作Item的property来实现的

## 12.1 动画元素分类

SpringAnimation，允许一个property跟踪一个值，动画效果类似于弹簧运动。

QtQuick还提供了用于组合多个动画对象的分组动画对象：

* SequentialAnimation，顺序执行一系列动画。
* ParallelAnimation，并行执行一系列动画。

还有一些对象虽然本身不是直接的动画元素，但却是有些QMLItem能够动起来的基础，我称之为动画搭档。

* State，Item的状态，不同状态对应不同的界面效果和业务逻辑，可以将动画应用于不同状态间的迁移过程。
* Transition，过渡，衔接Item的状态和动画，使状态变化过程平滑。

还有一些动画元素，需要与其他动画对象结合才能产生较好的效果，我称之为协同动画元素。

## 12.2 基本动画元素

Animatio---Qt Quick抽象出来的动画元素接口

### 12.2.1 Animation

Animation是Qt Quick中所有动画类的基类。

### 12.2.2 PropertyAnimation

（1）单独使用

我们在定义PropertyAnimation对象时，首先使用target属性指定要操作的目标对象，，，

然后使用property属性指明要改变目标对象的哪个属性，，，，

再使用to属性指定目标属性的目标值，，，

最后设置duration属性为1000毫秒，，，配置完毕

PropertyAnimation还有from属性

如果你想同时改变多个属性，，，

如果想同时改变多个目标对象，，，

easing属性，，，指定动画的松弛曲线

（2）在信号处理器中使用

（3）使用Animation on <property>

可以使用Animation on <property>这种语法将一个PropertyAnimation与一个属性关联起来

，，，我们把PropertyAnimation关联到widt属性上，这种定义方法，不需要再设定targe和property属性，

因为PropertyAnimation和width建立关联后，这两个属性不言自明。所以，采用这种方式定义动画，代码变得更加简单

### 12.2.3  NumberAnimation

NumberAnimation是PropeAnimation的派生类，专门处理数字类型的property，它重写了from和to两个属性，将其类型设置为real

### 12.2.4 ColorAnimation

ColorAnimation是PropeAnimation的派生类，专门处理color类型的property，它重写了from和to两个属性，将其类型设置为color

### 12.2.5 RotationAnimation

RotationAnimation是PropeAnimation的派生类，专门处理rotation和angle类型的property，它重写了from和to两个属性，将其类型设置为real

RotationAnimation在旋转一个Item时以Item的transformOrigin属性指定的点为中心，

这个属性为枚举类型，默认值是Item.Center。它可以取这些，，，

### 12.2.6 PathAnimation

PathAnimation是从Animation继承而来的，它让目标对象沿着一个既定的路径运动。像PropertyAnimation一样，它也有一个easing属性

anchoPoint属性描述目标对象的哪个店锚定在路径上

orientation属性控制目标对象沿着路径运动时的旋转策略

easing.type，我设置它为Easing.InOutCubic，这个类型会在前半程加速，到达终点后开始减速

### 12.2.7 SmoothedAnimation

SmoothedAnimation是NumberAnimation的派生类，它默认将easing.type设置为Easing.InOutQuad，在from和to之间产生平滑的动画效果

将velocity设置为-1禁用速率，如果from和to的距离过短，SmoothedAnimation会自行调整velocity来适应

当duration和velocity同时设置时，SmoothedAnimation会根据from、to之间的距离和速率计算出按照速率完成动画所需的时间，

拿这个时间与duration比较，如果duration短就使用duration，否则使用velocity。

### 12.2.8 SpringAnimation

SpringAnimation模仿弹簧的振荡行为

damping属性代表衰减系数，其值越大振荡会越快平复

## 12.3 组合动画

### 12.3.1 ParallelAnimation

ParallelAnimation从Animation继承而来，没有添加额外的属性，

它本身单独使用没有意义，不产生动画效果。

你只需要在声明ParallelAnimation对象时在其中定义多个子动画对象，

ParallelAnimation开始运行时就会并行执行它们。

### 12.3.2 SequentialAnimation

SequentialAnimation与ParallelAnimation类似，不同之处是它的子动画对象是一个个顺次执行的。

在onClicked信号处理器内SequentialAnimation重置了要变化的属性，以便动画每次开始执行时都初始初始状态

## 12.4 State

在QML中，状态是定义在State类型中的一系列属性配置

### 12.4.1 使用State变换文本的小示例

### 12.4.2 State详解

属性：

* name
* when
* extend
* changes，类型是list<Change>，一个列表，保存应用与这种状态的所有变化

总结一下，应用一种状态有两种方式：

* 显示改变Item的state属性
* 将State的when属性绑定到一个表达式上

可用于State的Change对象：

* PropertyChanges，，，，
* ParentChange，用来改变一个对象的父，，，
* AnchorChanges，，，，
* StateChangeScript，用来执行一个ECMAScript

### 12.4.3 PropertyChange

PropertyChanges的restoreEntryValues属性也是个布尔值，

用于指定离开本状态时是否将本状态改变的那些属性的值重置为进入本状态之前的值。

默认值为true，假如你设置这个属性为false，那么这种状态对目标对象的改变将是持久的。

PropertyChanges对象给rect的width属性赋值parent.width，

而parent.width本身是一个ECMAScript表达式，

由于PropertyChanges的explicit属性默认为false，于是rect.width绑定到了parent.width这个表达式上，

当我们改变窗口尺寸时，parent.width的返回值就会发生变化，于是rect的宽度也变了，始终与它的父Rectangle的宽度保持一致

给PropertyChanges对象声明添加一行代码“explicit：true”

设置explicit为true产生的效果：进入“resetwidth”状态时，

只是一次性地把parent.width计算出来作为一个静态的值传递给rect.width，没有发生表达式绑定行为。

### 12.4.4 ParentChange

* parent，指定目标对象的新parent

对于ParentChange对象，你只能使用它定义的那几个属性，否则会报错

PropertyChanges虽然只定义了少数几个属性，但你却可以设定Item支持的大多数属性

### 12.4.5 AnchorChanges

AnchorChanges用来改变一个Item的锚布局属性

AnchorChanges不能改变一个Item的锚布局留白，不过你可以使用PropertyChanges来改变它们

### 12.4.6 StateChangeScript

StateChangeScript允许你在状态变化时执行ECMAScript脚本。

它有两个属性，

一个是name，表示脚本的名字，这个名字可以被ScriptAction对象引用，以便复用这里的脚本代码；

一个是script，代表实际的脚本代码。

colorMaker.js，，，

PropertyChange可以实现ParentChange、AnchorChanges的功能，但后两者在实现相同的功能时效率会更好一些

## 12.5 Transition

State对Item的改变，就是瞬间移动

在GUI的角度来讲，“突变”这种体验也不那么友好。而Transition（过渡）的存在，就是为了消除这种突变

当一个Item从一个State切换到另一个State时，Transition定义的动画会自动在两个State之间运行，从而消除状态间的突变，是的状态迁移更加平滑

Item的transition属性是个列表

默认值也是“*”。如果你不设置from和to属性，那么Transition就会匹配所有的状态变化

reversible属性指定触发transition的条件反转时Transition是否自动反转，默认值是false。

如果你没有指定Transition的from和to属性，那么多个transition是并发执行的，而且会应用到所有状态变化路径上；

此时不需要设置reversible属性，因为当Item的State反转时也会触发transition。

但是如果你使用了SequentialAnimation或者设置了from、to属性，那么在某些场景下你可能需要设置reversible属性才能达到预期的效果。

当你为一个Transition定义动画时，不需要为Animation指定from和to属性。

from属性默认会被设置为Item对应属性的当前值，而to属性则会被设置为目标状态内为该属性设定的目标值。

当然，要是你愿意的话，也可以手动设置它们来覆盖默认值。target属性也不用指定，结合State和Transition，target是显而易见的。

Transition的animations属性是默认属性，所以我在为其定义动画对象时没有使用显式的初始化语句（animations:Type{}），

因为对于没有指定目标的对象声明，都会传递给默认属性。虽然这里定义的两个动画没有使用ParallelAnimation来分组，但它们依然是并行执行的，

MouseArea对象的hoverEnabled属性设置为true，处理鼠标经过的事件，使entered、exited信号生效。

然后在onEntered、onExited、onClicked三个信号处理器中显式地给linkText.state赋值来改变状态触发Transition。

## 12.6 协同动画元素

Behavior对象用于给Item的某个属性绑定默认动画。

ParentAnimation、AnchorAnimation通常需要和Transition、State联合使用。

PauseAnimation可以插入在 **多个动画之间产生暂停** 效果。
PropertyAction可以插入在 **多个动画之间来立即改变某个属性** 。
ScriptAction用于在 **动画执行过程中** 运行一段ECMAScript脚本。

### 12.6.1 Behavior

Behavior用来给一个property定义默认动画，

当该property变化时执行该动画。一个property只能绑定一个Behavior，

一个Behavior内只能有一个顶层动画（因为其animation属性的类型是Animation，而非list<Animation>），

如果你想在一个property变化时执行多个动画，则可以使用ParallelAnimation或SequentialAnimation。

如果你给Item定义了State，而State变化时触发了Transition，

Transition要改变的property上绑定了Behavior，那么Transition会覆盖Behavior。

使用Behavior定义动画时，动画对象不需要设置target、property、from、to等属性，非常方便。

因为animation是Behavior的默认属性，也不需要显式地初始化，只要直接在Behavior内声明动画对象即可。

### 12.6.2 ParentAnimation

ParentAnimation在改变一个Item的parent时使用，使得该Item从旧parent移动到新parent的过程更平滑。

ParentAnimation可以包含一个或多个其他的动画对象，这些动画会并发执行。

### 12.6.3 AnchorAnimation

我指定AnchorAnimation的easing.type为Easing.OutInCubic，效果是先减速到半程然后再加速。

## 12.7 ，，，

Qt Qucik动画元素的综合使用

# 第13章 Mode/View
## 13.1 ListView
## 13.2 XmlListModel的用法
## 13.3 使用C++ Model
## 13.4 TableView
## 13.5 ，，，
## 13.6 GridView
## 13.7 PathView
## 13.8 ，，，
## 13.9 Repeater
## 13.10 ListView的下拉刷新效果

# 第14章 多媒体
## 14.1 MediaPlayer
## 14.1.1 播放音乐
## 14.1.2 视频
## 14.1.3 多媒体元信息
## 14.2 拍照
## 14.2.1 配置Camera
## 14.2.2 设置取景器VideoOutput
## 14.2.3 捕获静态图片
## 14.2.4 简单的拍照实例

# 第15章 网络
## 15.1 ，，，支持网络的对象
### 15.1.1 Image
### 15.1.2 Qt.createComponent
### 15.1.3 Loader对象
### 15.1.4 QQmlApplicationEngine
### 15.1.5 QQuickView
### 15.1.6 MediaPlayer
## 15.2 QML里的HTTP
### 15.2.1 XMLHttpRequest类介绍
### 15.2.2 GET小示例
### 15.2.3 POST数据
## 15.3 使用C++代码完成复杂的网络操作

# 第16章 定位
## 16.1 类库介绍
## 16.1.1 coordinate
## 16.1.2 QtPositioning
## 16.1.3 Position
## 16.1.4 PositionSource
## 16.2 ，，，

# 第17章 综合实例之文件查看器

，，，

# 第18章 综合实例之聊哈

，，，

# 附录A 常见问题

**学习Qt Quick**
故意使用，，，编辑QML文档，韦德就是多记忆一些类库

**如何发布**
windeployqt 发布，，，qml放到qrc内，所有没有指定应用的qmlmulu

VC运行时库，，，在Qt，，，vcredist目录下，，，

Android版本，，，选择运行，选择部署策略，，，

**怎样保持Android手机屏幕常亮**

从QtActivity继承，重写onCreate方法，，，

在你的活动停止时关闭常亮标记，请重写onStop方法，，，

**创建可扩展的UI来适应各种屏幕**

使用BorderImage、结合PPI、DPI等可以实现这种需求

**如何国际化**

**应用体积太大**

* 只链接你需要的模块，范指Qt Quick模块和Qt C++模块
* 请尝试自己编译Qt库，裁剪不需要的功能

**静态库版本的Qt**

**隐藏QML文档**

* 把所有的QMl文档都放在qrc中
* 使用Qt企业版

**自定义Qt Quick控件**

可以使用Canvas，从头绘制控件

**文件操作**

C++代码来访问

**数据库**

”Local storage”
