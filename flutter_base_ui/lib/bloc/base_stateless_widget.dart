import 'package:flutter/material.dart';
import 'package:flutter_base_ui/bloc/base_bloc.dart';
import 'package:flutter_base_ui/bloc/bloc_provider.dart';
import 'package:flutter_base_ui/bloc/loading_bean.dart';
import 'package:flutter_base_ui/bloc/page_type.dart';
import 'package:flutter_base_ui/bloc/refresh_scaffold.dart';
import 'package:flutter_base_ui/style/common_style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseStatelessWidget<T extends LoadingBean, B extends BaseBloc<T>>
    extends StatelessWidget {
  static final String TAG = "BaseStatelessWidget";

  PageType getPageType();

  String getTitle(BuildContext context) {
    return "";
  }

  bool isShowAppBar() {
    return true;
  }

  bool enablePullUp() {
    return false;
  }

  bool enablePullDown() {
    return true;
  }

  bool isLoading(T data);

  Widget buildFloatingActionButton(BuildContext context) {
    return null;
  }

  Widget getHeader(BuildContext context, T data) {
    return null;
  }

  int getItemCount(T data) {
    return 0;
  }

  Widget buildItemBuilder(BuildContext context, T data, int index) {
    return null;
  }

  Widget getChild(BuildContext context, T data) {
    return null;
  }

  T initialData() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    B bloc = BlocProvider.of<B>(context);
    bloc.initData(context);

    return Scaffold(
      appBar: isShowAppBar()
          ? AppBar(
              elevation: 0,
              title: Text(
                getTitle(context),
                style: YZConstant.normalTextWhite,
              ),
            )
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
          return RefreshScaffold(
            isLoading: isLoading(snapshot.data),
            controller: controller,
            enablePullDown: enablePullDown(),
            enablePullUp: enablePullUp(),
            onRefresh: () {
              bloc.onRefresh();
            },
            onLoadMore: () {
              bloc.onLoadMore();
            },
            itemCount: getItemCount(snapshot.data),
            itemBuilder: (BuildContext context, int index) {
              return buildItemBuilder(context, snapshot.data, index);
            },
            floatingActionButton: buildFloatingActionButton(context),
            header: getHeader(context, snapshot.data),
            child: getChild(context, snapshot.data),
          );
        });
  }
}
