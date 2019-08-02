import 'package:flutter/material.dart';
import 'package:flutter_base_ui/bloc/base_bloc.dart';
import 'package:flutter_base_ui/bloc/bloc_provider.dart';
import 'package:flutter_base_ui/bloc/loading_bean.dart';
import 'package:flutter_base_ui/bloc/page_type.dart';
import 'package:flutter_base_ui/bloc/refresh_pull_list.dart';
import 'package:flutter_base_ui/style/common_style.dart';
import 'package:flutter_common_util/flutter_common_util.dart';
import 'package:open_git/util/common_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseStatelessWidget<T extends LoadingBean, B extends BaseBloc<T>>
    extends StatelessWidget {
  static final String TAG = "BaseStatelessWidget";

  PageType getPageType();

  bool isLoading(T data);

  String getTitle(BuildContext context) => '';

  bool isShowAppBar() => true;

  bool enablePullUp() => false;

  bool enablePullDown() => true;

  Widget buildFloatingActionButton(BuildContext context) => null;

  Widget getHeader(BuildContext context, T data) => null;

  int getItemCount(T data) => 0;

  Widget buildItemBuilder(BuildContext context, T data, int index) => null;

  Widget getChild(BuildContext context, T data) => null;

  T initialData() => null;

  bool isShowSideBar() => false;

  bool isShowAppBarActions() => false;

  double getOffset(BuildContext context, String letter) => 0;

  void _onPopSelected(BuildContext context, String value) {
    switch (value) {
      case "browser":
        openWebView(context);
        break;
    }
  }

  void openWebView(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    B bloc = BlocProvider.of<B>(context);
    bloc.initData(context);

    return Scaffold(
      appBar: isShowAppBar()
          ? CommonUtil.getAppBar(getTitle(context),
              actions: _getAction(context))
          : null,
      body: _buildBody(context, bloc),
    );
  }

  Widget _buildBody(BuildContext context, B bloc) {
    RefreshController controller = RefreshController();

    bloc.statusStream.listen((event) {
      if (event.type == getPageType()) {
//        LogUtil.v(
//            'page is ${event.page}@type is ${event.type}@noMore is ${event.noMore}',
//            tag: TAG);
        if (event.page == 1) {
          controller.refreshCompleted(/*resetFooterState: event.noMore*/);
          if (event.noMore) {
            controller.loadComplete();
            controller.loadNoData();
          }
        } else if (event.noMore) {
          controller.loadNoData();
        } else {
          controller.loadComplete();
        }
      }
    });

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
            controller: controller,
            enablePullDown: enablePullDown(),
            enablePullUp: enablePullUp(),
            onRefresh: () {
              bloc.onRefresh();
            },
            onLoadMore: () {
              bloc.onLoadMore();
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
            heroTag: getPageType(),
          );
        });
  }

  List<Widget> _getAction(BuildContext context) {
    if (!isShowAppBarActions()) {
      return null;
    }
    return [
      PopupMenuButton(
        padding: const EdgeInsets.all(0.0),
        onSelected: (value) {
          _onPopSelected(context, value);
        },
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
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
                      '浏览器打开',
                      style: YZConstant.middleText,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    ];
  }
}
