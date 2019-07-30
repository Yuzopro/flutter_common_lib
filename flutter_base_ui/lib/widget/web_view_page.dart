import 'package:flutter/material.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:flutter_common_util/flutter_common_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:open_git/util/common_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                  style: YZConstant.normalTextWhite,
                ),
                actions: <Widget>[
                  PopupMenuButton(
                    padding: const EdgeInsets.all(0.0),
                    onSelected: _onPopSelected,
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<String>>[
                      PopupMenuItem<String>(
                        value: "browser",
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          dense: false,
                          title: Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.language,
                                  color: Color(YZColors.mainTextColor),
                                  size: 22.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '系统浏览器打开',
                                  style: YZConstant.middleText,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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

  void _onPopSelected(String value) {
    switch (value) {
      case "browser":
        _launchInBrowser(widget.url, title: widget.title);
        break;
      default:
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
