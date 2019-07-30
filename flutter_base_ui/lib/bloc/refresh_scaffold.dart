import 'package:flutter/material.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:flutter_base_ui/widget/side_bar.dart';
import 'package:flutter_common_util/flutter_common_util.dart';
import 'package:open_git/util/common_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef IndexedOffsetBuilder = double Function(
    BuildContext context, String letter);

class RefreshScaffold extends StatefulWidget {
  const RefreshScaffold(
      {Key key,
      this.isLoading,
      this.isError: false,
      @required this.controller,
      this.enablePullDown: true,
      this.enablePullUp: true,
      this.onRefresh,
      this.onLoadMore,
      this.child,
      this.itemCount,
      this.itemBuilder,
      this.floatingActionButton,
      this.header,
      this.offsetBuilder,
      this.onReload})
      : super(key: key);

  final bool isLoading;
  final bool isError;
  final RefreshController controller;
  final bool enablePullDown, enablePullUp;
  final RefreshCallback onRefresh;
  final RefreshCallback onLoadMore;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget floatingActionButton;
  final Widget header;
  final IndexedOffsetBuilder offsetBuilder;
  final Function onReload;

  @override
  State<StatefulWidget> createState() {
    return RefreshScaffoldState();
  }
}

class RefreshScaffoldState extends State<RefreshScaffold>
    with AutomaticKeepAliveClientMixin {
  static final String TAG = "RefreshScaffold";

  bool _isShowFloatBtn = false;

  String _letter;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      int offset = _scrollController.offset.toInt();

      if (offset < 480 && _isShowFloatBtn) {
        _isShowFloatBtn = false;
        setState(() {});
      } else if (offset > 480 && !_isShowFloatBtn) {
        _isShowFloatBtn = true;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildPullList(),
          _buildLoading(),
          _buildEmptyView(),
          _buildErrorView(),
          _buildSideBar(context),
          _buildLetterTips(),
        ],
      ),
      floatingActionButton:
          widget.floatingActionButton ?? buildFloatingActionButton(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.dispose();
    _scrollController?.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildFloatingActionButton() {
    if (!_isShowFloatBtn) {
      return null;
    }

    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        Icons.keyboard_arrow_up,
      ),
      onPressed: () {
        _scrollController.animateTo(0.0,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      },
    );
  }

  Widget _buildPullList() {
    int itemCount =
        widget.header == null ? widget.itemCount : widget.itemCount + 1;

    return SmartRefresher(
      controller: widget.controller,
      header: MaterialClassicHeader(
        color: Colors.black,
      ),
      footer: ClassicFooter(
        loadingIcon: const SizedBox(
          width: 25.0,
          height: 25.0,
          child: const CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation(Colors.black),
          ),
        ),
      ),
      enablePullDown: widget.enablePullDown,
      enablePullUp: widget.enablePullUp,
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoadMore,
      child: widget.child ??
          ListView.builder(
            controller: _scrollController,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              if (widget.header != null && index == 0) {
                return widget.header;
              }
              return widget.itemBuilder(
                  context, widget.header == null ? index : index - 1);
            },
          ),
    );
  }

  Widget _buildLoading() {
    return CommonUtil.getLoading(context, widget.isLoading);
  }

  Widget _buildEmptyView() {
    return Offstage(
      offstage: widget.itemCount != 0 || widget.isLoading || widget.isError,
      child: Center(
        child: SizedBox(
          width: 256.0,
          height: 256.0,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.error_outline,
                size: 128.0,
                color: Color(YZColors.subLightTextColor),
              ),
              SizedBox(height: 5.0),
              Text(
                '暂无更多数据',
                style: YZConstant.normalSubText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorView() {
    return Offstage(
      offstage: !widget.isError || widget.isLoading,
      child: Center(
        child: SizedBox(
          width: 256.0,
          height: 256.0,
          child: InkWell(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.network_check,
                  size: 128.0,
                  color: Color(YZColors.subLightTextColor),
                ),
                SizedBox(height: 5.0),
                Text(
                  '网络开小差，检查后再试吧',
                  style: YZConstant.normalSubText,
                ),
              ],
            ),
            onTap: widget.onReload,
          ),
        ),
      ),
    );
  }

  Widget _buildSideBar(BuildContext context) {
    return Offstage(
      offstage: widget.offsetBuilder == null,
      child: Align(
        alignment: Alignment.centerRight,
        child: SideBar(
          onTouch: (letter) {
            setState(() {
              _letter = letter;
            });
            if (!TextUtil.isEmpty(letter)) {
              double offset = widget.offsetBuilder(context, letter);
              if (offset != null) {
                _scrollController.jumpTo(offset.clamp(
                    .0, _scrollController.position.maxScrollExtent));
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildLetterTips() {
    return Offstage(
      offstage: TextUtil.isEmpty(_letter),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 65.0,
          height: 65.0,
          color: Color(0x40000000),
          child: Text(
            TextUtil.isEmpty(_letter) ? '' : _letter,
            style: YZConstant.largeLargeTextWhite,
          ),
        ),
      ),
    );
  }
}
