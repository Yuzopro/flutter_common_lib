import 'package:flutter/material.dart';
import 'package:flutter_base_ui/bloc/base_bloc.dart';
import 'package:flutter_base_ui/bloc/bloc_provider.dart';
import 'package:flutter_base_ui/bloc/loading_bean.dart';
import 'package:flutter_base_ui/bloc/refresh_pull_list.dart';
import 'package:flutter_base_ui/style/common_style.dart';
import 'package:flutter_base_ui/util/common_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_common_util/flutter_common_util.dart';

abstract class BaseStatelessWidget<T extends LoadingBean, B extends BaseBloc<T>>
    extends StatelessWidget {
  static final String TAG = "BaseStatelessWidget";

  bool isLoading(T data);

  String getTitle(BuildContext context) => '';

  bool isShowAppBar() => true;

  bool enablePullUp(BuildContext context) => false;

  bool enablePullDown() => true;

  bool isShowEmpty(T data) => true;

  Widget buildFloatingActionButton(BuildContext context) => null;

  Widget getHeader(BuildContext context, T data) => null;

  int getItemCount(T data) => 0;

  Widget buildItemBuilder(BuildContext context, T data, int index) => null;

  Widget getChild(BuildContext context, T data) => null;

  T initialData() => null;

  bool isShowSideBar() => false;

  bool isShowAppBarActions() => false;

  double getOffset(BuildContext context, String letter) => 0;

  final RefreshController _refreshController = RefreshController();

  void onRefresh(BuildContext context) async {
    BaseBloc bloc = BlocProvider.of<B>(context);
    await bloc.onRefresh();
    _refreshController.refreshCompleted(resetFooterState: true);
  }

  void onLoadMore(BuildContext context) async {
    BaseBloc bloc = BlocProvider.of<B>(context);
    await bloc.onLoadMore();
    if (bloc.noMore) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    B bloc = BlocProvider.of<B>(context);
    bloc.firstInit(context);

    return Scaffold(
      appBar: isShowAppBar()
          ? CommonUtil.getAppBar(getTitle(context),
              actions: getAction(context))
          : null,
      body: _buildBody(context, bloc),
    );
  }

  Widget _buildBody(BuildContext context, B bloc) {
    return StreamBuilder(
        stream: bloc.stream,
        initialData: initialData(),
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
//          LogUtil.v(
//              'type is ${getPageType().toString()}@isLoading is ' +
//                  isLoading(snapshot.data).toString(),
//              tag: TAG);
          return RefreshPullList(
            isLoading: isLoading(snapshot.data),
            isError: snapshot.data != null ? snapshot.data.isError : false,
            controller: _refreshController,
            enablePullDown: enablePullDown(),
            enablePullUp: enablePullUp(context),
            onRefresh: () {
              onRefresh(context);
            },
            onLoadMore: () {
              onLoadMore(context);
            },
            onReload: () {
              bloc.onReload();
            },
            itemCount: getItemCount(snapshot.data),
            itemBuilder: (BuildContext context, int index) {
              return buildItemBuilder(context, snapshot.data, index);
            },
            floatingActionButton: buildFloatingActionButton(context),
            header: getHeader(context, snapshot.data),
            offsetBuilder: isShowSideBar()
                ? (context, letter) {
                    return getOffset(context, letter);
                  }
                : null,
            child: getChild(context, snapshot.data),
            heroTag: _getHeroTag(),
            isShowEmpty: isShowEmpty(snapshot.data),
          );
        });
  }

  Object _getHeroTag() {
    return this;
  }

  List<Widget> getAction(BuildContext context) {
    if (!isShowAppBarActions()) {
      return null;
    }
    return [
      PopupMenuButton(
        padding: const EdgeInsets.all(0.0),
        onSelected: (value) {
          onPopSelected(context, value);
        },
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
          getPopupMenuItem('browser', Icons.language, '浏览器打开'),
          getPopupMenuItem('share', Icons.share, '分享'),
        ],
      )
    ];
  }

  PopupMenuItem getPopupMenuItem(String value, IconData icon, String title) {
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

  void onPopSelected(BuildContext context, String value) {
    switch (value) {
      case "browser":
        openWebView(context);
        break;
      case 'share':
        _share(context);
        break;
    }
  }

  void openWebView(BuildContext context) {}

  void _share(BuildContext context) {
    ShareUtil.share(getShareText(context));
  }

  String getShareText(BuildContext context) => '';
}
