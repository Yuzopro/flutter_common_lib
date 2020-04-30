import 'package:flutter/material.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:flutter_base_ui/util/common_util.dart';
import 'package:flutter_common_util/flutter_common_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef IndexedOffsetBuilder = double Function(
    BuildContext context, String letter);

class RefreshPullList extends StatefulWidget {
  const RefreshPullList(
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
      this.heroTag,
      this.isShowEmpty,
      this.onReload,
      this.isShowTitle,
      this.title,
      this.actions,
      this.isNeedScaffold})
      : super(key: key);

  final bool isLoading;
  final bool isError;
  final RefreshController controller;
  final bool enablePullDown, enablePullUp;
  final VoidCallback onRefresh;
  final VoidCallback onLoadMore;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget floatingActionButton;
  final Widget header;
  final IndexedOffsetBuilder offsetBuilder;
  final Function onReload;
  final Object heroTag;
  final bool isShowEmpty;
  final bool isShowTitle;
  final String title;
  final List<Widget> actions;
  final bool isNeedScaffold;

  @override
  State<StatefulWidget> createState() {
    return RefreshPullListState();
  }
}

class RefreshPullListState extends State<RefreshPullList>
    with AutomaticKeepAliveClientMixin {
  static final String TAG = "RefreshScaffold";

  bool _isShowFloatBtn = false;

  String _letter;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    if (widget.child == null) {
      _scrollController = ScrollController();
      _scrollController?.addListener(() {
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
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    //todo 后续优化
    if (widget.isNeedScaffold) {
      return Scaffold(
        appBar: widget.isShowTitle
            ? CommonUtil.getAppBar(widget.title, actions: widget.actions)
            : null,
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
    } else {
      return Stack(
        children: <Widget>[
          _RefreshListView(widget),
          _buildLoading(),
          _buildEmptyView(),
          _buildErrorView(),
          _buildSideBar(context),
          _buildLetterTips(),
        ],
      );
    }
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
      //fix There are multiple heroes that share the same tag within a subtree
      heroTag: widget.heroTag,
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        Icons.keyboard_arrow_up,
      ),
      onPressed: () {
        _scrollController?.animateTo(0.0,
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
      offstage: widget.itemCount != 0 ||
          widget.isLoading ||
          widget.isError ||
          !widget.isShowEmpty,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageUtil.getImage('assets/images/ic_no_data.png', 128.0, 128.0),
            SizedBox(height: 5.0),
            Text(
              '暂无更多数据',
              style: YZStyle.normalSubText,
            ),
          ],
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
                ImageUtil.getImage(
                    'assets/images/ic_network_error.png', 128.0, 128.0),
                SizedBox(height: 5.0),
                Text(
                  '网络开小差，检查后再试吧',
                  style: YZStyle.normalSubText,
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
                _scrollController?.jumpTo(offset.clamp(
                    .0, _scrollController?.position.maxScrollExtent));
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
            style: YZStyle.largeLargeTextWhite,
          ),
        ),
      ),
    );
  }
}

class _RefreshListView extends StatefulWidget {
  RefreshPullList widget;

  _RefreshListView(RefreshPullList widget) {
    this.widget = widget;
  }

  @override
  State<StatefulWidget> createState() {
    return _RefreshListViewState();
  }
}

class _RefreshListViewState extends State<_RefreshListView> {
  @override
  Widget build(BuildContext context) {
    int itemCount = widget.widget.header == null
        ? widget.widget.itemCount
        : widget.widget.itemCount + 1;

    return _buildPullList();
  }

  Widget _buildPullList() {
    int itemCount =
    widget.widget.header == null ? widget.widget.itemCount : widget.widget.itemCount + 1;

    return SmartRefresher(
      controller: widget.widget.controller,
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
      enablePullDown: widget.widget.enablePullDown,
      enablePullUp: widget.widget.enablePullUp,
      onRefresh: widget.widget.onRefresh,
      onLoading: widget.widget.onLoadMore,
      child: widget.widget.child ??
          ListView.builder(
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              if (widget.widget.header != null && index == 0) {
                return widget.widget.header;
              }
              return widget.widget.itemBuilder(
                  context, widget.widget.header == null ? index : index - 1);
            },
          ),
    );
  }

}
