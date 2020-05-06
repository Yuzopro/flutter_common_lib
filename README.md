# OpenGit_Flutter项目常用公共库

version : 1.1.0

OpenGit公共库目前包含三部分

* 基本UI库（flutter_base_ui）；
* 常用工具类库（flutter_common_util）；
* 安装APK插件；

## 基本UI库

### BloC和MVP基本封装

详情可以参考文章[MVC、MVP、BloC、Redux四种架构在Flutter上的尝试](https://yuzopro.github.io/2019/07/13/MVC-MVP-BloC-Redux%E5%9B%9B%E7%A7%8D%E6%9E%B6%E6%9E%84%E5%9C%A8Flutter%E4%B8%8A%E7%9A%84%E5%B0%9D%E8%AF%95/)

### 基本Style的提供

主要颜色，如下面代码所示
```dart
class YZColors {
  static const int miWhite = 0xFFF4F5F6;

  static const int white = 0xFFFFFFFF;

  static const int mainBackgroundColor = miWhite;

  static const int textColor = 0xFF081530;
  static const int t65TextColor = 0xA6081530;
  static const int subTextColor = 0xFF8C939F;
  static const int textColorWhite = white;

  static const int redPointColor = 0xFFED5E4B;
}
```

文本主要样式，如下面代码所示
```dart
class YZStyle {
  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextWhiteSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;

  static const minSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: minTextSize,
  );

  static const minText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: minTextSize,
  );

  static const smallTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: smallTextSize,
  );

  static const smallText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: smallTextSize,
  );

  static const smallTextT65 = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.t65TextColor),
    fontSize: smallTextSize,
  );

  static const smallTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const smallSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: middleTextWhiteSize,
  );

  static const middleSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: middleTextWhiteSize,
  );
  
  static const middleTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleTextWhiteBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleSubTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const normalText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: normalTextSize,
  );

  static const normalTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalSubText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.subTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: normalTextSize,
  );

  static const normalTextMitWhiteBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.miWhite),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: bigTextSize,
  );

  static const largeTextBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: bigTextSize,
  );

  static const largeTextWhiteBold = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeTextWhite = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColorWhite),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeText = TextStyle(
    fontFamily: YZFonts.montserrat_font_family,
    color: Color(YZColors.textColor),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );
}
```

主要字体，如下面代码所示
```dart
class YZFonts {
  static const String montserrat_font_family = 'Montserrat';
}
```

主要图片大小，如下面代码所示
```dart
class YZSize {
  static const SMALL_IMAGE_SIZE = 18.0;
  static const NORMAL_IMAGE_SIZE = 24.0;
  static const BIG_IMAGE_SIZE = 36.0;
  static const LARGE_IMAGE_SIZE = 48.0;
}
```

### 基础Widget

#### 图片浏览Widget

支持网络图片的加载，如下面代码所示
```dart
class PhotoViewPage extends StatelessWidget {
  final String title;
  final String url;

  PhotoViewPage(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: YZStyle.normalTextWhite,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: PhotoView(
          imageProvider: NetworkImage(url),
          loadingChild: Container(
            child: Stack(
              children: <Widget>[
                Center(
                    child: ImageUtil.getImage(
                        ImagePath.image_default_head, 180.0, 180.0)),
                Center(
                  child: SpinKitCircle(color: Colors.white30, size: 25.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

#### h5网页加载Widget

支持h5链接的加载、系统浏览器打开以及分享等功能，如下面代码所示
```dart
typedef OnWillPop = void Function(BuildContext context);

class WebViewPage extends StatefulWidget {
  final String title;
  final String url;
  final OnWillPop onWillPop;

  const WebViewPage({Key key, this.title, this.url, this.onWillPop: null})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewState();
  }
}

class _WebViewState extends State<WebViewPage> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: widget.onWillPop != null
            ? null
            : AppBar(
                centerTitle: true,
                title: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: YZStyle.normalTextWhite,
                ),
                actions: <Widget>[
                  PopupMenuButton(
                    padding: const EdgeInsets.all(0.0),
                    onSelected: _onPopSelected,
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<String>>[
                          _getPopupMenuItem('browser', Icons.language, '浏览器打开'),
                          _getPopupMenuItem('share', Icons.share, '分享'),
                    ],
                  ),
                ],
              ),
        body: Stack(
          children: <Widget>[
            _buildWebView(),
            CommonUtil.getLoading(context, _isLoading),
          ],
        ),
      ),
      onWillPop: () {
        if (widget.onWillPop != null) {
          widget.onWillPop(context);
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
    );
  }

  Widget _buildWebView() {
    return WebView(
      onWebViewCreated: (WebViewController webViewController) {},
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (url) {
        setState(() {
          _isLoading = false;
        });
      },
    );
  }

  PopupMenuItem _getPopupMenuItem(String value, IconData icon, String title) {
    return PopupMenuItem<String>(
      value: value,
      child: ListTile(
        contentPadding: EdgeInsets.all(0.0),
        dense: false,
        title: Container(
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Color(YZColors.textColor),
                size: 22.0,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                title,
                style: YZStyle.middleText,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPopSelected(String value) {
    switch (value) {
      case "browser":
        _launchInBrowser(widget.url, title: widget.title);
        break;
      case 'share':
        ShareUtil.share(widget.url);
        break;
    }
  }

  Future<Null> _launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
```

#### 侧边栏SideBar

详情可以参考文章[Flutter侧边栏控件-SideBar](https://yuzopro.github.io/2019/07/29/Flutter%E4%BE%A7%E8%BE%B9%E6%A0%8F%E6%8E%A7%E4%BB%B6-SideBar/)

## 常用工具类库

### 颜色工具类（ColorUtil）

```dart
//str->color(0x000000,0xff000000,#000000)
Color color = ColorUtil.str2Color('0xff000000');
//color->str(000000)
String color = ColorUtil.color2RGB(_currentColor);
```

### 日期工具类（DateUtil）

```dart
///今天HH:mm
///昨天HH:mm
///星期几 HH:mm
///MM-dd HH:mm
///yyyy-MM-dd HH:mm
String date = DateUtil.getMultiDateStr(item.createdAt);

///支持的时间格式
enum DateFormat {
  yyyy_MM_dd_HH_mm_ss, //yyyy-MM-dd HH:mm:ss
  yyyy_MM_dd_HH_mm, //yyyy-MM-dd HH:mm
  yyyy_MM_dd, //yyyy-MM-dd
  yyyy_MM, //yyyy-MM
  MM_dd, //MM-dd
  MM_dd_HH_mm, //MM-dd HH:mm
  HH_mm_ss, //HH:mm:ss
  HH_mm, //HH:mm

  ZH_yyyy_MM_dd_HH_mm_ss, //yyyy年MM月dd日 HH时mm分ss秒
  ZH_yyyy_MM_dd_HH_mm, //yyyy年MM月dd日 HH时mm分
  ZH_yyyy_MM_dd, //yyyy年MM月dd日
  ZH_yyyy_MM, //yyyy年MM月
  ZH_MM_dd, //MM月dd日
  ZH_MM_dd_HH_mm, //MM月dd日 HH时mm分
  ZH_HH_mm_ss, //HH时mm分ss秒
  ZH_HH_mm, //HH时mm分
}
String date = DateUtil.getDateStrByDateTime(item.createdAt);

///周几
///zh
String weekday = DateUtil.getZHWeekDay(item.createdAt);
///en
String weekday = DateUtil.getWeekDay(item.createdAt);
```

### 文件工具类（FileUtil）

```dart
///文件大小 xB、xKB、xMB、xGB
String size = FileUtil.formatFileSize(repos.size);
```

### 图片工具类（ImageUtil）

```dart
/// 获取网络图片
Widget widget = ImageUtil.getCircleNetworkImage(head, 18.0, "assets/images/ic_default_head.png")
Widget widget = ImageUtil.getNetworkImage(head, 18.0, "assets/images/ic_default_head.png")
```

### 日志工具类（LogUtil）

详情信息可参考[log_util](https://github.com/Sky24n/common_utils/blob/master/lib/src/log_util.dart)

### 屏幕工具类（ScreenUtil）

```dart
///获取屏幕宽高
double width = ScreenUtil.getScreenWidth(context),
double height = ScreenUtil.getScreenHeight(context),
```

### SP缓存工具类（SpUtil）

```dart
///初始化
await SpUtil.instance.init();

SpUtil.instance.putInt(SharedPrfKey.SP_KEY_CACHE_TIME, _discreteValue.round());
int time =SpUtil.instance.getInt(SharedPrfKey.SP_KEY_CACHE_TIME, defValue: 4);

SpUtil.instance.putString(SharedPrfKey.SP_KEY_TRENDING_DATE, _since);
String _since = SpUtil.instance.getString(SharedPrfKey.SP_KEY_TRENDING_DATE, defValue: 'daily');

SpUtil.instance.putObject(SharedPrfKey.SP_KEY_USER_INFO, data);
var user = SpUtil.instance.getObject(SharedPrfKey.SP_KEY_USER_INFO);
```

### 文本工具类（TextUtil）

```dart
TextUtil.isEmpty(colorString);

TextUtil.equals(_language, language);

List<String> repos = TextUtil.split(item.repo.name, '/');
```

### 定时器工具类（TimerUtil）

```dart
TimerUtil.startCountdown(5, (int count) {
    next(CountdownAction(count));

    if (count == 0) {
      _jump(context, store.state.userState.status,
            store.state.userState.isGuide);
    }
});

TimerUtil.cancelCountdown();

TimerUtil.delay(500, (_) {
    viewModel.onStartCountdown();
});
```

### Toast工具类（ToastUtil）

```dart
ToastUtil.showMessgae('再按一次离开App');
```

### 分享（ShareUtil）

```dart
ShareUtil.share(OPEN_GIT_HOME);
```


## 安装APK插件

```dart
InstallApkPlugin.installApk(path);
```

## Android版安装包：
[点击下载](https://github.com/Yuzopro/opengit_flutter/releases/download/1.5.0/opengit-release-1.5.0)

扫码下载

![](https://user-gold-cdn.xitu.io/2020/4/30/171c8ab2086d31f9?w=300&h=300&f=png&s=5393)

## Thanks For

- [Sky24n](https://github.com/Sky24n)

## 项目地址

[OpenGit客户端](https://github.com/Yuzopro/OpenGit_Flutter)

## 关于作者

- [个人博客](https://yuzopro.github.io/)

- [Github](https://github.com/yuzopro)

- [掘金](https://juejin.im/user/56ea9d7ca341310054a57b7c)

- [简书](https://www.jianshu.com/u/ef3cb65219d4)

- [CSDN](https://blog.csdn.net/Yuzopro)