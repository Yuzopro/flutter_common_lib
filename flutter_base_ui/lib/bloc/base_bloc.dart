import 'package:flutter/material.dart';
import 'package:flutter_base_ui/bloc/loading_bean.dart';
import 'package:flutter_base_ui/bloc/page_type.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends LoadingBean> {
  static final String TAG = "BaseBloc";

  int page = 1;

  bool noMore = true;

  T bean;

  BehaviorSubject<T> _subject = BehaviorSubject<T>();

  Sink<T> get sink => _subject.sink;

  Stream<T> get stream => _subject.stream;

  void initData(BuildContext context);

  Future getData();

  void onReload();

  onRefresh() async {
    await getData();
  }

  onLoadMore() async {
    await getData();
  }

  void dispose() {
    _subject.close();
    sink.close();
  }

  void showLoading() {
    bean.isLoading = true;
    sink.add(bean);
  }

  void hideLoading() {
    bean.isLoading = false;
    sink.add(bean);
  }
}
